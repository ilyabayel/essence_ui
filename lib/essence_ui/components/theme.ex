defmodule EssenceUI.Components.Theme do
  @moduledoc """
  Theme root for Essence UI — applies accent, gray, radius, scaling, and appearance.

  Applies accent, gray, radius, scaling, and appearance via `data-*` attributes on a root wrapper.
  """
  use Phoenix.Component

  @accent_colors [
    "gray",
    "gold",
    "bronze",
    "brown",
    "yellow",
    "amber",
    "orange",
    "tomato",
    "red",
    "ruby",
    "crimson",
    "pink",
    "plum",
    "purple",
    "violet",
    "iris",
    "indigo",
    "blue",
    "cyan",
    "teal",
    "jade",
    "green",
    "grass",
    "lime",
    "mint",
    "sky"
  ]

  @gray_colors ["auto", "gray", "mauve", "slate", "sage", "olive", "sand"]
  @radii ["none", "small", "medium", "large", "full"]
  @scalings ["90%", "95%", "100%", "105%", "110%"]
  @appearances ["inherit", "light", "dark"]
  @panel_backgrounds ["solid", "translucent"]

  @doc """
  Renders a theme root.

  ## Examples

      <.theme accent_color="indigo" gray_color="slate">
        <.button>Hey</.button>
      </.theme>
  """
  attr :as, :string, default: "div", doc: "Element to render."
  attr :appearance, :string, default: "inherit", values: @appearances
  attr :accent_color, :string, default: "indigo", values: @accent_colors
  attr :gray_color, :string, default: "auto", values: @gray_colors
  attr :radius, :string, default: "medium", values: @radii
  attr :scaling, :string, default: "100%", values: @scalings
  attr :panel_background, :string, default: "solid", values: @panel_backgrounds
  attr :has_background, :boolean, default: true
  attr :is_root, :boolean, default: true, doc: "When true, sets data-is-root-theme for viewport styling."
  attr :class, :any, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def theme(assigns) do
    appearance_class =
      case assigns.appearance do
        "light" -> "light light-theme"
        "dark" -> "dark dark-theme"
        _ -> nil
      end

    assigns =
      assigns
      |> assign(:appearance_class, appearance_class)
      |> assign(:panel_bg, panel_background_style(assigns.panel_background, assigns.has_background))

    ~H"""
    <.dynamic_tag
      tag_name={@as}
      class={["essence-ui", @appearance_class, @class]}
      data-accent-color={@accent_color}
      data-gray-color={@gray_color}
      data-radius={@radius}
      data-scaling={@scaling}
      data-is-root-theme={if(@is_root, do: "true")}
      style={merge_style(@panel_bg, @style)}
      {@rest}
    >
      {render_slot(@inner_block)}
    </.dynamic_tag>
    """
  end

  def accent_colors, do: @accent_colors
  def gray_colors, do: @gray_colors
  def radii, do: @radii
  def scalings, do: @scalings

  defp panel_background_style("translucent", true),
    do: "background-color: var(--color-background); --color-panel: var(--color-panel-translucent);"

  defp panel_background_style(_, true),
    do: "background-color: var(--color-background); --color-panel: var(--color-panel-solid);"

  defp panel_background_style(_, false), do: "--color-panel: var(--color-panel-solid);"

  defp merge_style(a, nil), do: a
  defp merge_style(a, ""), do: a
  defp merge_style(a, b), do: a <> " " <> b
end
