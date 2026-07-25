defmodule EssenceUIWeb.Docs.Components do
  @moduledoc false
  use Phoenix.Component

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

    ~H"""
    <div class={["docs-demo", @class]}>
      <div
        class={preview_class(@variant)}
        data-component={@component}
        data-accent-color={theme_attr(@variant, "indigo")}
        data-gray-color={theme_attr(@variant, "slate")}
        data-radius={theme_attr(@variant, "medium")}
        data-scaling={theme_attr(@variant, "100%")}
      >
        {render_slot(@inner_block)}
      </div>

      <div :if={@has_heex or @has_css} class="docs-demo__source">
        <div class="docs-code-tabs">
          <input
            :if={@has_heex}
            type="radio"
            name={@tab_id}
            id={"#{@tab_id}-heex"}
            class="docs-code-tabs__input"
            checked
          />
          <label :if={@has_heex} for={"#{@tab_id}-heex"} class="docs-code-tabs__label">HEEx</label>

          <input
            :if={@has_css}
            type="radio"
            name={@tab_id}
            id={"#{@tab_id}-css"}
            class="docs-code-tabs__input"
            checked={!@has_heex}
          />
          <label :if={@has_css} for={"#{@tab_id}-css"} class="docs-code-tabs__label">CSS</label>

          <div :if={@has_heex} class="docs-code-tabs__panel docs-code-tabs__panel--heex">
            <.code_block language="heex" code={@heex} />
          </div>
          <div :if={@has_css} class="docs-code-tabs__panel docs-code-tabs__panel--css">
            <.code_block language="css" code={@css} />
          </div>
        </div>
      </div>
    </div>
    """
  end

  @doc "Standalone fenced-style code block."
  attr :code, :string, required: true
  attr :language, :string, default: "text"

  def code_block(assigns) do
    ~H"""
    <div class="docs-code-block" data-language={@language}>
      <pre><code>{@code}</code></pre>
    </div>
    """
  end

  @doc "Props table from Phoenix.Component attr metadata."
  attr :module, :atom, required: true
  attr :function, :atom, required: true

  def props_table(assigns) do
    meta = component_meta(assigns.module, assigns.function)
    assigns = assign(assigns, :attrs, meta.attrs)

    ~H"""
    <div class="docs-props">
      <table>
        <thead>
          <tr>
            <th>Prop</th>
            <th>Type</th>
            <th>Default</th>
            <th>Description</th>
          </tr>
        </thead>
        <tbody>
          <tr :for={attr <- @attrs}>
            <td><code>{attr.name}</code></td>
            <td><code>{format_type(attr)}</code></td>
            <td><code>{format_default(attr)}</code></td>
            <td>{attr[:doc] || ""}</td>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end

  @doc "Anatomy list for compound components."
  attr :parts, :list, required: true

  def anatomy(assigns) do
    ~H"""
    <div class="docs-anatomy">
      <h2 class="docs-anatomy__title">Anatomy</h2>
      <ul>
        <li :for={part <- @parts}>
          <code>{part.name}</code>
          <span :if={part[:description]}>{part.description}</span>
        </li>
      </ul>
    </div>
    """
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
