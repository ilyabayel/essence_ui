defmodule EssenceUI.Components.AlertDialog do
  @moduledoc """
  Themed alert dialog with overlay, content, and action subcomponents.

  Compound API keeps `alert_dialog/1` with `target`, `default_state`, and
  title/description slots. Internally wraps `EssenceUI.Primitives.AlertDialog`.
  """
  use Phoenix.Component

  alias EssenceUI.Primitives.AlertDialog, as: AlertDialogPrimitive
  alias EssenceUI.SharedProps.RadiusProps

  require RadiusProps

  attr :id, :string, required: true, doc: "Unique identifier for the alert dialog"
  attr :target, :string, required: true, doc: "The target element to attach the dialog to"

  attr :default_state, :string,
    default: "closed",
    values: ["open", "closed"],
    doc: "The default state of the dialog (open/closed)"

  attr :style, :string, default: ""
  attr :class, :string, default: ""
  attr :scaling, :string, default: "100%"
  RadiusProps.attrs()
  attr :gray_color, :string, default: "slate"
  attr :accent_color, :string, default: "blue"

  slot :title
  slot :description
  slot :inner_block

  def alert_dialog(assigns) do
    default_open = assigns.default_state == "open"

    assigns =
      assigns
      |> assign(:default_open, default_open)
      |> assign_new(:radius, fn -> "medium" end)

    ~H"""
    <AlertDialogPrimitive.root id={@id} default_open={@default_open}>
      <AlertDialogPrimitive.portal id={"#{@id}-portal"} target={@target}>
        <div
          class="essence-ui es-DialogRoot"
          data-scaling={@scaling}
          data-radius={@radius}
          data-gray-color={@gray_color}
          data-accent-color={@accent_color}
        >
          <AlertDialogPrimitive.overlay class="est-BaseDialogOverlay est-AlertDialogOverlay">
            <div class="est-BaseDialogScroll est-AlertDialogScroll">
              <div class="est-BaseDialogScrollPadding est-AlertDialogScrollPadding est-r-align-center">
                <AlertDialogPrimitive.content
                  id={"#{@id}-content"}
                  class={
                    [
                      "est-BaseDialogContent",
                      "est-AlertDialogContent",
                      "est-r-size-3",
                      "est-r-max-w",
                      @class
                    ]
                    |> Enum.filter(&(&1 != ""))
                    |> Enum.join(" ")
                  }
                  style={
                    ["--max-width: 450px; pointer-events: auto;", @style]
                    |> Enum.filter(&(&1 != ""))
                    |> Enum.join("; ")
                  }
                >
                  <AlertDialogPrimitive.title
                    :if={@title != []}
                    class="est-Heading est-r-size-5"
                    style="margin-bottom: var(--space-3)"
                  >
                    {render_slot(@title)}
                  </AlertDialogPrimitive.title>
                  <AlertDialogPrimitive.description
                    :if={@description != []}
                    class="est-Text est-r-size-2"
                    style="margin-bottom: var(--space-4)"
                  >
                    {render_slot(@description)}
                  </AlertDialogPrimitive.description>
                  {render_slot(@inner_block)}
                </AlertDialogPrimitive.content>
              </div>
            </div>
          </AlertDialogPrimitive.overlay>
        </div>
      </AlertDialogPrimitive.portal>
    </AlertDialogPrimitive.root>
    """
  end
end
