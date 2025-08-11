defmodule EssenceUI.Components.Select do
  @moduledoc """
  Select component styled per Radix Themes Select.

  This is a basic, non-portal implementation that renders a trigger and an optional menu.
  The `open` prop controls whether content is rendered. Overlay primitives will come later.
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
  @trigger_variants ["surface", "classic", "soft", "ghost"]
  @content_variants ["solid", "soft"]

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()

  attr :size, :string, values: @sizes, default: "2", doc: "Control trigger/content size."
  attr :trigger_variant, :string, values: @trigger_variants, default: "surface"
  attr :content_variant, :string, values: @content_variants, default: "solid"
  attr :placeholder, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :open, :boolean, default: false, doc: "Whether to render the content menu."
  attr :on_toggle, :string, default: nil, doc: "Event handler for toggle."
  attr :on_change, :string, default: nil, doc: "Event handler for change."
  attr :value, :string, default: nil, doc: "The value of the selected option."

  attr :class, :string, default: nil
  attr :style, :string, default: ""

  attr :rest, :global

  slot :option,
    doc: "Option item in the menu. Use attributes: value, disabled, selected.",
    required: false,
    do: [
      attr(:value, :string),
      attr(:disabled, :boolean),
      attr(:selected, :boolean)
    ]

  slot :label, doc: "Optional section label shown inside the menu."
  slot :separator, doc: "Optional separator line between groups inside the menu."

  def select(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true}
      }
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(HighContrastProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      [
        "rt-reset",
        extracted.class
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    selected_slot = Enum.find(assigns.option, &Map.get(&1, :selected))
    has_selected = not is_nil(selected_slot)
    data_placeholder = if not has_selected and assigns[:placeholder], do: true

    content_id = "select-content-" <> Integer.to_string(System.unique_integer([:positive]))

    assigns =
      assign(assigns,
        class: class,
        style: extracted.style <> "position: relative;",
        color: assigns[:color] || false,
        selected_slot: selected_slot,
        has_selected: has_selected,
        data_placeholder: data_placeholder,
        content_id: content_id,
        high_contrast: extracted[:high_contrast] || false
      )

    ~H"""
    <div class={@class} style={@style} data-accent-color={@color}>
      <button
        type="button"
        class={[
          "rt-SelectTrigger",
          "rt-variant-" <> @trigger_variant,
          "rt-r-size-" <> @size,
          "rt-reset"
        ]}
        {@rest}
        phx-click={@on_toggle}
        data-state={if @open, do: "open", else: "closed"}
        data-placeholder={@data_placeholder}
        disabled={@disabled}
        aria-haspopup="listbox"
        aria-expanded={@open}
        aria-controls={@content_id}
      >
        <span class="rt-SelectTriggerInner">
          <%= if @value do %>
            {@value}
          <% else %>
            {@placeholder}
          <% end %>
        </span>
        <span class="rt-SelectIcon" aria-hidden>
          <!-- simple chevron icon -->
          <svg
            width="10"
            height="6"
            viewBox="0 0 10 6"
            fill="currentColor"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M1 1l4 4 4-4"
              stroke="currentColor"
              stroke-width="1.5"
              fill="none"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>
        </span>
      </button>

      <%= if @open do %>
        <div
          class={[
            "rt-SelectContent",
            "rt-variant-" <> @content_variant,
            "rt-r-size-" <> @size,
            @high_contrast && "rt-high-contrast"
          ]}
          style="position: absolute; top: -1px; left: -1px; right: -1px;"
          data-side="bottom"
          id={@content_id}
          role="listbox"
        >
          <div class="rt-SelectViewport">
            <%= for label <- @label do %>
              <div class="rt-SelectLabel">{render_slot(label)}</div>
            <% end %>

            <%= for _sep <- @separator do %>
              <div class="rt-SelectSeparator" role="separator"></div>
            <% end %>

            <%= for opt <- @option do %>
              <div
                class="rt-SelectItem"
                data-disabled={Map.get(opt, :disabled) || nil}
                role="option"
                aria-selected={Map.get(opt, :selected) || false}
                phx-click={@on_change}
                phx-value-value={Map.get(opt, :value)}
              >
                <%= if Map.get(opt, :selected) do %>
                  <span class="rt-SelectItemIndicator" aria-hidden>
                    <svg
                      class="rt-SelectItemIndicatorIcon"
                      width="10"
                      height="10"
                      viewBox="0 0 10 10"
                      fill="currentColor"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="M2 5l2 2 4-4"
                        stroke="currentColor"
                        stroke-width="1.5"
                        fill="none"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                      />
                    </svg>
                  </span>
                <% end %>
                <span>{render_slot(opt)}</span>
              </div>
            <% end %>
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
