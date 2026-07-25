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
    <.card variant="surface" class={["docs-demo", @class]} style="overflow: hidden;">
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

      <.box :if={@has_heex or @has_css} style="border-top: 1px solid var(--gray-a5);">
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
    ~H"""
    <.box class="docs-code-block" p="3" data-language={@language} style="background: var(--gray-a2); overflow: auto;">
      <pre style="margin: 0;"><.code variant="ghost" high_contrast>{@code}</.code></pre>
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
    <.table variant="surface" size="1" class="docs-props">
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
    """
  end

  @doc "Anatomy list for compound components."
  attr :parts, :list, required: true

  def anatomy(assigns) do
    ~H"""
    <.box class="docs-anatomy" mb="5">
      <.heading as="h2" size="4" mb="3">Anatomy</.heading>
      <.data_list orientation="horizontal" size="2">
        <.data_list_item :for={part <- @parts}>
          <:label><.code size="2">{part.name}</.code></:label>
          <:value>
            <.text :if={part[:description]} size="2" color="gray">{part.description}</.text>
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
end
