defmodule EssenceUI.Components.Checkbox do
  @moduledoc """
  A simple, accessible Checkbox component for toggling between checked, unchecked, and indeterminate states.

  Based on Radix UI Themes Checkbox component with support for various sizes, variants,
  and colors. The checkbox provides visual feedback for user selections
  and can be used in forms, settings panels, and interactive lists.

  ## Examples

      <.checkbox />

      <.checkbox checked />

      <.checkbox size="3" variant="soft" color="blue" />

      <.checkbox checked="indeterminate" />

      <.checkbox disabled />

      <.checkbox name="newsletter" value="subscribe" checked />

  ## Props

  - `size` - Checkbox size: "1", "2", "3" (default: "2")
  - `variant` - Checkbox variant: "surface", "classic", "soft" (default: "surface")
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - `checked` - Controlled checked state (true/false/"indeterminate")
  - `disabled` - Whether the checkbox is disabled
  - `name` - Form name attribute
  - `value` - Form value attribute
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require HighContrastProps
  require MarginProps

  @sizes ["1", "2", "3"]
  @variants ["surface", "classic", "soft"]

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()

  attr :size, :string,
    values: @sizes,
    default: "2",
    doc: "Checkbox size from 1 to 3. Controls overall dimensions and indicator size."

  attr :variant, :string,
    values: @variants,
    default: "surface",
    doc: "Visual style variant. One of 'surface', 'classic', or 'soft'."

  attr :defulat_checked, :any,
    default: false,
    doc: "Initial checked state. If true, checkbox starts checked."

  attr :checked, :any,
    default: nil,
    doc: "Controlled checked state. Can be true, false, or 'indeterminate'."

  attr :disabled, :boolean,
    default: false,
    doc: "Whether the checkbox is disabled."

  attr :name, :string, default: nil, doc: "Form name attribute."
  attr :value, :string, default: nil, doc: "Form value attribute."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the element."
  attr :style, :string, default: ""

  attr :rest, :global,
    include: ~w(id form required aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  def checkbox(assigns) do
    prop_defs =
      %{
        size: %{
          type: :enum,
          class: "rt-r-size",
          values: @sizes,
          default: "2",
          responsive: true
        },
        variant: %{
          type: :enum,
          class: "rt-variant",
          values: @variants,
          default: "surface"
        }
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    checked = assigns[:checked] || assigns[:default_checked]

    # Determine checked state
    checked_state =
      cond do
        checked == "indeterminate" -> "indeterminate"
        checked == true -> "checked"
        checked == false -> "unchecked"
        is_nil(checked) -> "unchecked"
        true -> "unchecked"
      end

    # Determine aria-checked value
    aria_checked =
      case checked_state do
        "checked" -> "true"
        "unchecked" -> "false"
        "indeterminate" -> "mixed"
      end

    # Build CSS classes
    class =
      [
        "rt-reset",
        "rt-BaseCheckboxRoot",
        "rt-CheckboxRoot",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style,
        checked_state: checked_state,
        aria_checked: aria_checked,
        color: assigns[:color] || false
      )

    ~H"""
    <button
      type="button"
      role="checkbox"
      aria-checked={@aria_checked}
      data-state={@checked_state}
      data-accent-color={@color}
      class={@class}
      style={@style <> "cursor: pointer;"}
      name={@name}
      value={@value}
      disabled={@disabled}
      {@rest}
    >
      <%= case @checked_state do %>
        <% "indeterminate" -> %>
          <svg
            width="9"
            height="9"
            viewBox="0 0 9 9"
            fill="currentcolor"
            xmlns="http://www.w3.org/2000/svg"
            data-state="indeterminate"
            class="rt-BaseCheckboxIndicator rt-CheckboxIndicator"
            style="pointer-events: none;"
          >
            <path
              fill-rule="evenodd"
              clip-rule="evenodd"
              d="M0.75 4.5C0.75 4.08579 1.08579 3.75 1.5 3.75H7.5C7.91421 3.75 8.25 4.08579 8.25 4.5C8.25 4.91421 7.91421 5.25 7.5 5.25H1.5C1.08579 5.25 0.75 4.91421 0.75 4.5Z"
            >
            </path>
          </svg>
        <% "checked" -> %>
          <svg
            width="9"
            height="9"
            viewBox="0 0 9 9"
            fill="currentcolor"
            xmlns="http://www.w3.org/2000/svg"
            data-state="checked"
            class="rt-BaseCheckboxIndicator rt-CheckboxIndicator"
            style="pointer-events: none;"
          >
            <path
              fill-rule="evenodd"
              clip-rule="evenodd"
              d="M8.53547 0.62293C8.88226 0.849446 8.97976 1.3142 8.75325 1.66099L4.5083 8.1599C4.38833 8.34356 4.19397 8.4655 3.9764 8.49358C3.75883 8.52167 3.53987 8.45309 3.3772 8.30591L0.616113 5.80777C0.308959 5.52987 0.285246 5.05559 0.563148 4.74844C0.84105 4.44128 1.31533 4.41757 1.62249 4.69547L3.73256 6.60459L7.49741 0.840706C7.72393 0.493916 8.18868 0.396414 8.53547 0.62293Z"
            >
            </path>
          </svg>
        <% "unchecked" -> %>
          <span></span>
      <% end %>
    </button>
    """
  end
end
