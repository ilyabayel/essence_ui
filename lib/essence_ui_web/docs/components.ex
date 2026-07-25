defmodule EssenceUIWeb.Docs.Components do
  @moduledoc false
  use Phoenix.Component

  import EssenceUI.Components

  @doc """
  Live preview with optional HEEx / CSS source tabs.
  """
  attr :heex, :string, default: nil
  attr :css, :string, default: nil
  attr :variant, :string, default: "theme", values: ["theme", "primitive"]
  attr :component, :string, default: nil
  attr :class, :string, default: nil
  slot :inner_block, required: true

  def demo(assigns) do
    assigns =
      assigns
      |> assign_new(:tab_id, fn -> "demo-#{System.unique_integer([:positive])}" end)
      |> assign(:has_css, is_binary(assigns.css) and assigns.css != "")
      |> assign(:has_heex, is_binary(assigns.heex) and assigns.heex != "")
      |> assign(:default_tab, default_tab(assigns))

    ~H"""
    <.card variant="surface" class={["docs-demo", @class]}>
      <.box
        class={preview_class(@variant)}
        p="5"
        data-component={@component}
        data-accent-color={theme_attr(@variant, "indigo")}
        data-gray-color={theme_attr(@variant, "slate")}
        data-radius={theme_attr(@variant, "medium")}
        data-scaling={theme_attr(@variant, "100%")}
      >
        {render_slot(@inner_block)}
      </.box>

      <.box :if={@has_heex or @has_css} class="docs-demo__source">
        <.tabs id={@tab_id} default_value={@default_tab}>
          <:list>
            <.tabs_list size="1">
              <:trigger :if={@has_heex} value="heex">HEEx</:trigger>
              <:trigger :if={@has_css} value="css">CSS</:trigger>
            </.tabs_list>
          </:list>
          <:content :if={@has_heex} value="heex">
            <.code_block language="heex" code={@heex} />
          </:content>
          <:content :if={@has_css} value="css">
            <.code_block language="css" code={@css} />
          </:content>
        </.tabs>
      </.box>
    </.card>
    """
  end

  @doc "Standalone fenced-style code block."
  attr :code, :string, required: true
  attr :language, :string, default: "text"

  def code_block(assigns) do
    assigns = assign(assigns, :formatted, format_source(assigns.code, assigns.language))

    ~H"""
    <.box class="docs-code-block" data-language={@language}>
      <pre><code>{@formatted}</code></pre>
    </.box>
    """
  end

  @doc "Props table from Phoenix.Component attr metadata."
  attr :module, :atom, required: true
  attr :function, :atom, required: true

  def props_table(assigns) do
    meta = component_meta(assigns.module, assigns.function)
    assigns = assign(assigns, :attrs, meta.attrs)

    ~H"""
    <.box class="docs-props">
      <.box class="docs-props__desktop" role="region" aria-label="Props table" tabindex="0">
        <.table variant="surface" size="1">
          <.table_header>
            <.table_row>
              <.table_column_header_cell>Prop</.table_column_header_cell>
              <.table_column_header_cell>Type</.table_column_header_cell>
              <.table_column_header_cell>Default</.table_column_header_cell>
              <.table_column_header_cell>Description</.table_column_header_cell>
            </.table_row>
          </.table_header>
          <.table_body>
            <.table_row :for={attr <- @attrs}>
              <.table_row_header_cell><.code size="1">{attr.name}</.code></.table_row_header_cell>
              <.table_cell><.code size="1" variant="ghost" color="gray">{format_type(attr)}</.code></.table_cell>
              <.table_cell><.code size="1" variant="ghost" color="gray">{format_default(attr)}</.code></.table_cell>
              <.table_cell><.text size="1" color="gray">{attr[:doc] || ""}</.text></.table_cell>
            </.table_row>
          </.table_body>
        </.table>
      </.box>

      <.flex direction="column" gap="3" class="docs-props__mobile">
        <.box :for={attr <- @attrs} class="docs-props__card" p="3">
          <.flex direction="column" gap="2">
            <.code size="2">{attr.name}</.code>
            <.text size="1" color="gray">{attr[:doc] || ""}</.text>
            <.flex gap="3" wrap="wrap">
              <.text size="1" color="gray">
                Type <.code size="1" variant="ghost">{format_type(attr)}</.code>
              </.text>
              <.text size="1" color="gray">
                Default <.code size="1" variant="ghost">{format_default(attr)}</.code>
              </.text>
            </.flex>
          </.flex>
        </.box>
      </.flex>
    </.box>
    """
  end

  @doc "Anatomy list for compound components."
  slot :part, required: true do
    attr :name, :string, required: true
  end

  def anatomy(assigns) do
    ~H"""
    <.box class="docs-anatomy" mb="5">
      <.heading as="h2" size="4" mb="3">Anatomy</.heading>
      <.data_list orientation="vertical" size="2" class="docs-anatomy__list">
        <.data_list_item :for={part <- @part}>
          <:label><.code size="2">{part.name}</.code></:label>
          <:value>
            <.text size="2" color="gray">{render_slot(part)}</.text>
          </:value>
        </.data_list_item>
      </.data_list>
    </.box>
    """
  end

  defp default_tab(assigns) do
    heex? = is_binary(assigns[:heex]) and assigns[:heex] != ""
    if heex?, do: "heex", else: "css"
  end

  defp preview_class("primitive"), do: "docs-demo__preview radix-demo"
  defp preview_class(_), do: "docs-demo__preview essence-ui"

  defp theme_attr("theme", value), do: value
  defp theme_attr(_, _), do: nil

  defp component_meta(module, function) do
    case module.__components__()[function] do
      %{attrs: attrs} = meta ->
        %{meta | attrs: Enum.reject(attrs, &(&1.name == :rest))}

      nil ->
        raise ArgumentError, "#{inspect(module)}.#{function}/1 has no component metadata"
    end
  end

  defp format_type(%{type: :string, values: values}) when is_list(values),
    do: Enum.map_join(values, " | ", &inspect/1)

  defp format_type(%{type: type}), do: to_string(type)

  defp format_default(%{opts: opts}) do
    case Keyword.fetch(opts, :default) do
      {:ok, value} -> inspect(value)
      :error -> "—"
    end
  end

  defp format_default(_), do: "—"

  defp format_source(code, language) when language in ["heex", "html"] do
    code
    |> String.trim()
    |> String.replace(~r/\s+/, " ")
    |> String.replace(~r"/>\s*</", "/>\n<")
    |> String.replace(~r"/>(?=<)/", "/>\n")
    |> String.replace(~r">(?=<\.)", ">\n")
    |> String.replace(~r"></", ">\n</")
    |> String.split("\n")
    |> Enum.map_join("\n", &String.trim/1)
  end

  defp format_source(code, _), do: String.trim(code)
end
