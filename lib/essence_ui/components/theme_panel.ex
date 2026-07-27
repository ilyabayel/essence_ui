defmodule EssenceUI.Components.ThemePanel do
  @moduledoc """
  Dev-oriented theme controls (accent, gray, appearance, radius, scaling).

  Emits `phx-change="theme_panel"` with form fields. Parent LiveView should
  update theme assigns and optionally push appearance to the document.
  """
  use Phoenix.Component

  import EssenceUI.Components.Button, only: [button: 1]
  import EssenceUI.Components.Card, only: [card: 1]
  import EssenceUI.Components.Flex, only: [flex: 1]
  import EssenceUI.Components.Heading, only: [heading: 1]
  import EssenceUI.Components.Separator, only: [separator: 1]
  import EssenceUI.Components.Text, only: [text: 1]

  alias EssenceUI.Components.Theme

  @doc """
  Renders a ThemePanel.

  ## Assigns expected from parent (via attrs)

  - `accent_color`, `gray_color`, `appearance`, `radius`, `scaling`, `panel_background`
  """
  attr :accent_color, :string, default: "indigo"
  attr :gray_color, :string, default: "slate"
  attr :appearance, :string, default: "inherit"
  attr :radius, :string, default: "medium"
  attr :scaling, :string, default: "100%"
  attr :panel_background, :string, default: "solid"
  attr :on_change, :string, default: "theme_panel", doc: "LiveView event for form change"
  attr :on_copy, :string, default: "copy_theme", doc: "LiveView event to copy theme HEEx"
  attr :class, :any, default: nil
  attr :rest, :global

  def theme_panel(assigns) do
    class =
      ["rt-ThemePanel", "theme-panel", assigns.class]
      |> Enum.reject(&(is_nil(&1) or &1 == ""))
      |> Enum.join(" ")

    assigns = assign(assigns, :panel_class, class)

    ~H"""
    <.card variant="surface" class={@panel_class} {@rest}>
      <.flex direction="column" gap="4" p="4">
        <.heading as="h3" size="3">Theme</.heading>

        <form id="theme-panel-form" phx-change={@on_change}>
          <.flex direction="column" gap="4">
            <.flex direction="column" gap="2">
              <.text size="1" weight="bold">Accent color</.text>
              <.flex gap="2" wrap="wrap" class="theme-panel__swatches">
                <label
                  :for={color <- Theme.accent_colors()}
                  class="rt-ThemePanelSwatch"
                  style={"background-color: var(--#{color}-9)"}
                  title={color}
                >
                  <input
                    type="radio"
                    name="accent_color"
                    value={color}
                    checked={color == @accent_color}
                    class="rt-ThemePanelSwatchInput"
                    aria-label={color}
                  />
                </label>
              </.flex>
            </.flex>

            <.flex direction="column" gap="2">
              <.text size="1" weight="bold">Gray color</.text>
              <.flex gap="2" wrap="wrap" class="theme-panel__swatches">
                <label
                  :for={color <- Enum.reject(Theme.gray_colors(), &(&1 == "auto"))}
                  class="rt-ThemePanelSwatch"
                  style={"background-color: var(--#{color}-9)"}
                  title={color}
                >
                  <input
                    type="radio"
                    name="gray_color"
                    value={color}
                    checked={color == @gray_color}
                    class="rt-ThemePanelSwatchInput"
                    aria-label={color}
                  />
                </label>
              </.flex>
            </.flex>

            <.flex direction="column" gap="2">
              <.text size="1" weight="bold">Appearance</.text>
              <.flex gap="2" wrap="wrap">
                <label
                  :for={value <- ["inherit", "light", "dark"]}
                  class="rt-ThemePanelRadioCard"
                  style="padding: 0.35rem 0.65rem;"
                >
                  <input
                    type="radio"
                    name="appearance"
                    value={value}
                    checked={value == @appearance}
                    class="rt-ThemePanelRadioCardInput"
                  />
                  <.text size="1">{String.capitalize(value)}</.text>
                </label>
              </.flex>
            </.flex>

            <.flex direction="column" gap="2">
              <.text size="1" weight="bold">Radius</.text>
              <.flex gap="2" wrap="wrap">
                <label
                  :for={value <- Theme.radii()}
                  class="rt-ThemePanelRadioCard"
                  style="padding: 0.35rem 0.65rem;"
                >
                  <input
                    type="radio"
                    name="radius"
                    value={value}
                    checked={value == @radius}
                    class="rt-ThemePanelRadioCardInput"
                  />
                  <.text size="1">{String.capitalize(value)}</.text>
                </label>
              </.flex>
            </.flex>

            <.flex direction="column" gap="2">
              <.text size="1" weight="bold">Scaling</.text>
              <.flex gap="2" wrap="wrap">
                <label
                  :for={value <- Theme.scalings()}
                  class="rt-ThemePanelRadioCard"
                  style="padding: 0.35rem 0.65rem;"
                >
                  <input
                    type="radio"
                    name="scaling"
                    value={value}
                    checked={value == @scaling}
                    class="rt-ThemePanelRadioCardInput"
                  />
                  <.text size="1">{value}</.text>
                </label>
              </.flex>
            </.flex>

            <.flex direction="column" gap="2">
              <.text size="1" weight="bold">Panel background</.text>
              <.flex gap="2" wrap="wrap">
                <label
                  :for={value <- ["solid", "translucent"]}
                  class="rt-ThemePanelRadioCard"
                  style="padding: 0.35rem 0.65rem;"
                >
                  <input
                    type="radio"
                    name="panel_background"
                    value={value}
                    checked={value == @panel_background}
                    class="rt-ThemePanelRadioCardInput"
                  />
                  <.text size="1">{String.capitalize(value)}</.text>
                </label>
              </.flex>
            </.flex>
          </.flex>
        </form>

        <.separator size="1" />

        <.button type="button" variant="soft" color="gray" size="2" phx-click={@on_copy}>
          Copy Theme
        </.button>
      </.flex>
    </.card>
    """
  end

  @doc "HEEx snippet for current theme attrs."
  def copy_snippet(opts) when is_map(opts) do
    accent = Map.get(opts, :accent_color, "indigo")
    gray = Map.get(opts, :gray_color, "slate")
    appearance = Map.get(opts, :appearance, "inherit")
    radius = Map.get(opts, :radius, "medium")
    scaling = Map.get(opts, :scaling, "100%")
    panel = Map.get(opts, :panel_background, "solid")

    String.trim("""
    <.theme
      accent_color={#{inspect(accent)}}
      gray_color={#{inspect(gray)}}
      appearance={#{inspect(appearance)}}
      radius={#{inspect(radius)}}
      scaling={#{inspect(scaling)}}
      panel_background={#{inspect(panel)}}
    >
      {@inner_content}
    </.theme>
    """)
  end
end
