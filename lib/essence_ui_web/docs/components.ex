defmodule EssenceUIWeb.Docs.Components do
  @moduledoc false
  use Phoenix.Component

  import EssenceUI.Components

  alias Makeup.Formatters.HTML.HTMLFormatter
  alias Makeup.Lexers.HEExLexer
  alias Makeup.Lexers.HTMLLexer
  alias Makeup.Registry
  alias MakeupSyntect.Lexer, as: SyntectLexer

  @doc """
  Live preview with HEEx / CSS source tabs.

  Use `<:heex>` for the live markup. Pass CSS as an argument, typically via
  `css={primitive_css("accordion")}` available in Markdown through PageLive imports.
  """
  attr :variant, :string, default: "theme", values: ["theme", "primitive"]
  attr :component, :string, default: nil
  attr :class, :string, default: nil
  attr :css, :string, default: nil

  slot :heex, required: true do
    attr :code, :string
  end

  def demo(assigns) do
    heex_code = slot_code(assigns.heex) || fallback_heex_code(assigns.variant, assigns.component)
    css_code = assigns.css
    primitive? = assigns.variant == "primitive"
    canvas_css = if primitive?, do: demo_canvas_css(), else: nil

    assigns =
      assigns
      |> assign_new(:tab_id, fn -> "demo-#{System.unique_integer([:positive])}" end)
      |> assign(:heex_code, heex_code)
      |> assign(:css_code, css_code)
      |> assign(:canvas_css, canvas_css)
      |> assign(:has_canvas_css, is_binary(canvas_css) and canvas_css != "")
      |> assign(:has_heex_code, is_binary(heex_code) and heex_code != "")
      |> assign(:has_css_code, is_binary(css_code) and css_code != "")
      |> assign(:default_tab, if(is_binary(heex_code) and heex_code != "", do: "heex", else: "css"))

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
        <style :if={@has_canvas_css}>
          <%= Phoenix.HTML.raw(@canvas_css) %>
        </style>
        <style :if={@has_css_code}>
          <%= Phoenix.HTML.raw(@css_code) %>
        </style>
        {render_slot(@heex)}
      </.box>

      <.box :if={@has_heex_code or @has_css_code} class="docs-demo__source">
        <.tabs id={@tab_id} default_value={@default_tab}>
          <:list>
            <.tabs_list size="1">
              <:trigger :if={@has_heex_code} value="heex">HEEx</:trigger>
              <:trigger :if={@has_css_code} value="css">CSS</:trigger>
            </.tabs_list>
          </:list>
          <:content :if={@has_heex_code} value="heex">
            <.code_block language="heex" code={@heex_code} />
          </:content>
          <:content :if={@has_css_code} value="css">
            <.code_block language="css" code={@css_code} />
          </:content>
        </.tabs>
      </.box>
    </.card>
    """
  end

  @doc """
  Load primitives demo CSS for Markdown: `css={primitive_css("dialog")}`.

  Returns the component stylesheet only (no demo canvas). Strips `@import`
  lines and `.radix-demo[data-component]` selector prefixes so the CSS tab
  shows copy-pasteable `Demo*` rules.
  """
  def primitive_css(component) when is_binary(component) do
    case read_primitive_css("#{component}.css") do
      nil -> ""
      css -> css |> strip_css_imports() |> unwrap_radix_demo_selectors()
    end
  end

  @doc "Standalone fenced-style code block with Makeup highlighting for HEEx/HTML/CSS."
  attr :code, :string, required: true
  attr :language, :string, default: "text"

  def code_block(assigns) do
    assigns =
      assigns
      |> assign(:highlighted, highlight_source(assigns.code, assigns.language))
      |> assign_new(:copy_id, fn -> "copy-#{System.unique_integer([:positive])}" end)

    ~H"""
    <.box class="docs-code-block" data-language={@language} id={@copy_id} phx-hook="CopyCode">
      <button type="button" class="docs-code-block__copy" data-copy aria-label="Copy code">
        Copy
      </button>
      <pre><code class={"language-#{@language}"}>{Phoenix.HTML.raw(@highlighted)}</code></pre>
    </.box>
    """
  end

  @doc "Keyboard shortcut table for primitives a11y sections."
  slot :row, required: true do
    attr :keys, :string, required: true
  end

  def keyboard_table(assigns) do
    ~H"""
    <.box class="docs-keyboard">
      <.heading as="h3" size="3">Keyboard Interactions</.heading>
      <.table variant="surface" size="1">
        <.table_header>
          <.table_row>
            <.table_column_header_cell>Key</.table_column_header_cell>
            <.table_column_header_cell>Description</.table_column_header_cell>
          </.table_row>
        </.table_header>
        <.table_body>
          <.table_row :for={row <- @row}>
            <.table_row_header_cell>
              <.code size="1">{row.keys}</.code>
            </.table_row_header_cell>
            <.table_cell>
              <.text size="2">{render_slot(row)}</.text>
            </.table_cell>
          </.table_row>
        </.table_body>
      </.table>
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
              <.table_row_header_cell>
                <.code size="1">{attr.name}</.code>
              </.table_row_header_cell>
              <.table_cell>
                <.code size="1" variant="ghost" color="gray">{format_type(attr)}</.code>
              </.table_cell>
              <.table_cell>
                <.code size="1" variant="ghost" color="gray">{format_default(attr)}</.code>
              </.table_cell>
              <.table_cell>
                <.text size="1" color="gray">{attr[:doc] || ""}</.text>
              </.table_cell>
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
                Type
                <.code size="1" variant="ghost">{format_type(attr)}</.code>
              </.text>
              <.text size="1" color="gray">
                Default
                <.code size="1" variant="ghost">{format_default(attr)}</.code>
              </.text>
            </.flex>
          </.flex>
        </.box>
      </.flex>
    </.box>
    """
  end

  @doc "Feature bullet list (Radix Highlights equivalent)."
  slot :item, required: true

  def highlights(assigns) do
    ~H"""
    <.box class="docs-highlights" mb="5">
      <.flex direction="column" gap="2" class="docs-highlights__list">
        <.flex :for={item <- @item} gap="2" align="start" class="docs-highlights__item">
          <.text size="2" color="gray" high_contrast>•</.text>
          <.text size="2">{render_slot(item)}</.text>
        </.flex>
      </.flex>
    </.box>
    """
  end

  @doc "Data attribute reference table for stateful parts."
  slot :row, required: true do
    attr :name, :string, required: true
    attr :values, :string, required: true
  end

  def data_attributes_table(assigns) do
    ~H"""
    <.box class="docs-data-attrs" mb="4">
      <.heading as="h4" size="2" mb="2">Data attributes</.heading>
      <.table variant="surface" size="1">
        <.table_header>
          <.table_row>
            <.table_column_header_cell>Attribute</.table_column_header_cell>
            <.table_column_header_cell>Values</.table_column_header_cell>
            <.table_column_header_cell>Description</.table_column_header_cell>
          </.table_row>
        </.table_header>
        <.table_body>
          <.table_row :for={row <- @row}>
            <.table_row_header_cell>
              <.code size="1">{row.name}</.code>
            </.table_row_header_cell>
            <.table_cell>
              <.code size="1" variant="ghost" color="gray">{row.values}</.code>
            </.table_cell>
            <.table_cell>
              <.text size="2">{render_slot(row)}</.text>
            </.table_cell>
          </.table_row>
        </.table_body>
      </.table>
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
          <:label>
            <.code size="2">{part.name}</.code>
          </:label>
          <:value>
            <.text size="2" color="gray">{render_slot(part)}</.text>
          </:value>
        </.data_list_item>
      </.data_list>
    </.box>
    """
  end

  defp slot_code([]), do: nil

  defp slot_code([%{code: code} | _]) when is_binary(code) and code != "", do: code

  defp slot_code(_), do: nil

  defp fallback_heex_code("primitive", component) when is_binary(component) do
    snake = String.replace(component, "-", "_")
    path = Path.expand("../../../storybook/primitives/#{snake}.story.exs", __DIR__)

    with true <- File.exists?(path),
         {:ok, contents} <- File.read(path),
         [_, template] <- Regex.run(~r/template:\s*"""(.*?)"""/s, contents) do
      String.trim(template)
    else
      _ -> nil
    end
  end

  defp fallback_heex_code(_, _), do: nil

  defp read_primitive_css(filename) do
    path = Path.expand("../../../assets/css/primitives/#{filename}", __DIR__)

    if File.exists?(path) do
      File.read!(path)
    end
  end

  # Canvas layout for the preview only (not shown in the CSS tab).
  defp demo_canvas_css do
    case read_primitive_css("demo-canvas.css") do
      nil -> ""
      css -> strip_css_imports(css)
    end
  end

  # @import to node_modules colors does not resolve inside <style>; tokens already
  # ship via the main Essence UI stylesheet.
  defp strip_css_imports(css) when is_binary(css) do
    css
    |> String.replace(~r/^@import\s+[^;]+;\s*/m, "")
    |> String.trim()
  end

  # Drop `.radix-demo[data-component="…"]` so the CSS tab shows component-local rules.
  defp unwrap_radix_demo_selectors(css) when is_binary(css) do
    css
    |> String.replace(~r/\.radix-demo\[data-component="[^"]+"\]\s*/m, "")
    |> String.trim()
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

  defp format_type(%{type: :string, values: values}) when is_list(values), do: Enum.map_join(values, " | ", &inspect/1)

  defp format_type(%{type: type}), do: to_string(type)

  defp format_default(%{opts: opts}) do
    case Keyword.fetch(opts, :default) do
      {:ok, value} -> inspect(value)
      :error -> "—"
    end
  end

  defp format_default(_), do: "—"

  defp highlight_source(code, language) when is_binary(code) do
    code
    |> format_source(language)
    |> highlight_formatted(language)
  end

  defp format_source(code, language) when language in ["heex", "html"] do
    code
    |> Phoenix.LiveView.HTMLFormatter.format([])
    |> String.trim()
  end

  defp format_source(code, _), do: String.trim(code)

  defp highlight_formatted(code, "heex") do
    ensure_html_lexer_registered()
    code |> HEExLexer.lex() |> HTMLFormatter.format_inner_as_binary([])
  rescue
    _ -> escape_code(code)
  end

  defp highlight_formatted(code, "html") do
    ensure_html_lexer_registered()
    code |> HTMLLexer.lex() |> HTMLFormatter.format_inner_as_binary([])
  rescue
    _ -> escape_code(code)
  end

  defp highlight_formatted(code, "css") do
    ensure_syntect_css_lexer()
    {lexer, opts} = Registry.fetch_lexer_by_name!("css")
    code |> lexer.lex(opts) |> HTMLFormatter.format_inner_as_binary([])
  rescue
    _ -> escape_code(code)
  end

  defp highlight_formatted(code, _), do: escape_code(code)

  defp escape_code(code) do
    code |> Phoenix.HTML.html_escape() |> Phoenix.HTML.safe_to_string()
  end

  defp ensure_html_lexer_registered do
    if is_nil(Registry.get_lexer_by_name("html")) and
         is_nil(Registry.get_lexer_by_extension("html")) do
      Registry.register_lexer(HTMLLexer, options: [], names: ["html"], extensions: ["html"])
    end
  end

  defp ensure_syntect_css_lexer do
    {:ok, _} = Application.ensure_all_started(:makeup_syntect)

    if is_nil(Registry.get_lexer_by_name("css")) do
      Registry.register_lexer(SyntectLexer,
        options: [language: "CSS"],
        names: ["css", "CSS"],
        extensions: ["css"]
      )
    end
  end
end
