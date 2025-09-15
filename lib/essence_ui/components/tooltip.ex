defmodule EssenceUI.Components.Tooltip do
  @moduledoc """
  A Tooltip component that displays contextual information when hovering or focusing on an element.

  Based on Radix UI Tooltip component with support for various placements,
  delays, and styling options.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require MarginProps

  @sides ["top", "right", "bottom", "left"]
  @alignments ["start", "center", "end"]

  @doc """
  Renders a tooltip component.

  ## Examples

      <.tooltip content="This is a tooltip">
        <.button>Hover me</.button>
      </.tooltip>

      <.tooltip content="Custom tooltip" side="right" align="start">
        <.icon_button><Icons.info /></.icon_button>
      </.tooltip>

  ## Props

  - `content` - The tooltip content (required)
  - `side` - Tooltip placement: "top", "right", "bottom", "left" (default: "top")
  - `align` - Tooltip alignment: "start", "center", "end" (default: "center")
  - `open_delay` - Delay before showing (in ms) (default: 700)
  - `close_delay` - Delay before hiding (in ms) (default: 300)
  - `color` - Color theme (default: accent color)
  - Plus margin props (m, mx, my, mt, mr, mb, ml)
  """

  ColorProps.attrs()
  MarginProps.attrs()
  attr :content, :string, required: true, doc: "Tooltip content"
  attr :side, :string, values: @sides, default: "top", doc: "Tooltip placement"
  attr :align, :string, values: @alignments, default: "center", doc: "Tooltip alignment"
  attr :open_delay, :integer, default: 700, doc: "Delay before showing (ms)"
  attr :close_delay, :integer, default: 300, doc: "Delay before hiding (ms)"
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :style, :string, default: nil, doc: "Additional inline styles"
  attr :rest, :global
  slot :inner_block, required: true

  def tooltip(assigns) do
    prop_defs =
      %{}
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    tooltip_id = "tooltip-#{System.unique_integer([:positive])}"

    assigns =
      assigns
      |> assign(tooltip_id: tooltip_id)
      |> assign(color: assigns[:color] || false)
      |> assign(extracted_style: extracted.style)
      |> assign(extracted_class: extracted.class)

    ~H"""
    <div class="rt-TooltipRoot" data-state="closed">
      <div
        class="rt-TooltipTrigger"
        data-state="closed"
        phx-hook=".Tooltip"
        id={"#{@tooltip_id}-trigger"}
        data-tooltip-id={@tooltip_id}
        data-open-delay={@open_delay}
        data-close-delay={@close_delay}
      >
        {render_slot(@inner_block)}
      </div>
      <div
        class={
          [
            "rt-TooltipContent",
            "rt-reset",
            @extracted_class
          ]
          |> Enum.filter(& &1)
          |> Enum.join(" ")
        }
        style={@extracted_style}
        role="tooltip"
        id={@tooltip_id}
        data-side={@side}
        data-align={@align}
        data-accent-color={@color}
        data-state="closed"
        {@rest}
      >
        {@content}
        <div class="rt-TooltipArrow" data-side={@side}></div>
      </div>
    </div>

    <script :type={Phoenix.LiveView.ColocatedHook} name=".Tooltip">
      export default {
        mounted() {
          this.openDelay = parseInt(this.el.dataset.openDelay) || 700;
          this.closeDelay = parseInt(this.el.dataset.closeDelay) || 300;
          this.tooltipId = this.el.dataset.tooltipId;
          this.tooltip = document.getElementById(this.tooltipId);

          this.openTimeout = null;
          this.closeTimeout = null;

          this.el.addEventListener('mouseenter', () => this.show());
          this.el.addEventListener('mouseleave', () => this.hide());
          this.el.addEventListener('focusin', () => this.show());
          this.el.addEventListener('focusout', () => this.hide());
        },

        show() {
          if (this.closeTimeout) {
            clearTimeout(this.closeTimeout);
            this.closeTimeout = null;
          }

          if (!this.openTimeout) {
            this.openTimeout = setTimeout(() => {
              this.tooltip.dataset.state = 'open';
              this.el.dataset.state = 'open';
              this.positionTooltip();
              this.openTimeout = null;
            }, this.openDelay);
          }
        },

        hide() {
          if (this.openTimeout) {
            clearTimeout(this.openTimeout);
            this.openTimeout = null;
          }

          if (!this.closeTimeout) {
            this.closeTimeout = setTimeout(() => {
              this.tooltip.dataset.state = 'closed';
              this.el.dataset.state = 'closed';
              this.closeTimeout = null;
            }, this.closeDelay);
          }
        },

        positionTooltip() {
          // Simple positioning - can be enhanced with proper floating-ui integration
          const triggerRect = this.el.getBoundingClientRect();
          const side = this.tooltip.dataset.side;

          let top, left;

          switch(side) {
            case 'top':
              top = triggerRect.top - this.tooltip.offsetHeight - 8;
              left = triggerRect.left + (triggerRect.width / 2) - (this.tooltip.offsetWidth / 2);
              break;
            case 'bottom':
              top = triggerRect.bottom + 8;
              left = triggerRect.left + (triggerRect.width / 2) - (this.tooltip.offsetWidth / 2);
              break;
            case 'left':
              top = triggerRect.top + (triggerRect.height / 2) - (this.tooltip.offsetHeight / 2);
              left = triggerRect.left - this.tooltip.offsetWidth - 8;
              break;
            case 'right':
              top = triggerRect.top + (triggerRect.height / 2) - (this.tooltip.offsetHeight / 2);
              left = triggerRect.right + 8;
              break;
          }

          this.tooltip.style.position = 'fixed';
          this.tooltip.style.top = top + 'px';
          this.tooltip.style.left = left + 'px';
          this.tooltip.style.zIndex = '9999';
        },

        destroyed() {
          if (this.openTimeout) clearTimeout(this.openTimeout);
          if (this.closeTimeout) clearTimeout(this.closeTimeout);
        }
      }
    </script>
    """
  end
end
