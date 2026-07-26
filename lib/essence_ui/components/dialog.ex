defmodule EssenceUI.Components.Dialog do
  @moduledoc """
  Dialog component compatible with Radix UI Themes Dialog visuals.

  Themes façade: `dialog/1` and `dialog_content/1` with `target` and `default_state`.
  Internally wraps `EssenceUI.Primitives.Dialog` (root / portal / overlay / content).
  """

  use Phoenix.Component

  alias EssenceUI.Primitives.Dialog, as: DialogPrimitive
  alias EssenceUI.SharedProps.RadiusProps

  require RadiusProps

  attr :target, :string, required: true, doc: "CSS selector for portal target"
  attr :default_state, :string, default: "closed", doc: "open closed"
  attr :id, :string, default: nil, doc: "Unique identifier for the dialog"
  attr :style, :string, default: ""
  attr :class, :string, default: ""
  attr :scaling, :string, default: "100%"
  RadiusProps.attrs()
  attr :gray_color, :string, default: "slate"
  attr :accent_color, :string, default: "blue"
  slot :inner_block, required: true

  def dialog(assigns) do
    id = assigns[:id] || "dialog-#{System.unique_integer([:positive])}"
    default_open = assigns.default_state == "open"

    assigns =
      assigns
      |> assign(:id, id)
      |> assign(:default_open, default_open)
      |> assign_new(:radius, fn -> "medium" end)

    ~H"""
    <DialogPrimitive.root id={@id} default_open={@default_open}>
      <DialogPrimitive.portal id={"#{@id}-portal"} target={@target}>
        <div
          class="essence-ui es-DialogRoot"
          data-scaling={@scaling}
          data-radius={@radius}
          data-gray-color={@gray_color}
          data-accent-color={@accent_color}
        >
          <DialogPrimitive.overlay class="est-BaseDialogOverlay est-DialogOverlay">
            <div class="est-BaseDialogScroll est-DialogScroll">
              <div class="est-BaseDialogScrollPadding est-DialogScrollPadding est-r-align-center">
                <.dialog_content dialog_id={@id} style={@style} class={@class}>
                  {render_slot(@inner_block)}
                </.dialog_content>
              </div>
            </div>
          </DialogPrimitive.overlay>
        </div>
      </DialogPrimitive.portal>
    </DialogPrimitive.root>
    """
  end

  attr :dialog_id, :string, required: true, doc: "Unique identifier for the dialog"
  attr :style, :string, default: ""
  attr :class, :string, default: ""
  slot :inner_block, required: true

  def dialog_content(assigns) do
    ~H"""
    <DialogPrimitive.content
      id={"#{@dialog_id}-content"}
      class={
        ["est-BaseDialogContent", "est-DialogContent", "est-r-size-3", "est-r-max-w", @class]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join(" ")
      }
      style={
        ["--max-width: 450px; pointer-events: auto;", @style]
        |> Enum.filter(&(&1 != ""))
        |> Enum.join("; ")
      }
    >
      {render_slot(@inner_block)}
    </DialogPrimitive.content>
    """
  end
end
