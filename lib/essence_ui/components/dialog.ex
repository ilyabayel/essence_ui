defmodule EssenceUI.Components.Dialog do
  @moduledoc """
  Dialog primitive component compatible with Radix UI Dialog API.

  A window overlaid on either the primary window or another dialog window,
  rendering the content underneath inert.

  Based on Radix UI Dialog primitive.
  See: https://www.radix-ui.com/primitives/docs/components/dialog
  """

  use Phoenix.Component

  alias EssenceUI.SharedProps.MarginProps
  alias Phoenix.LiveView.JS

  require MarginProps

  attr :target, :string, required: true, doc: "CSS selector for portal target"
  attr :default_state, :string, default: "closed", doc: "open closed"
  attr :id, :string, default: nil, doc: "Unique identifier for the dialog"
  attr :style, :string, default: ""
  attr :class, :string, default: ""
  attr :scaling, :string, default: "100%"
  attr :radius, :string, default: "medium"
  attr :gray_color, :string, default: "slate"
  attr :accent_color, :string, default: "blue"
  slot :inner_block, required: true

  def dialog(assigns) do
    ~H"""
    <.portal target={@target} id={@id <> "portal"}>
      <div
        class="essence-ui es-DialogRoot"
        data-scaling={@scaling}
        data-radius={@radius}
        data-gray-color={@gray_color}
        data-accent-color={@accent_color}
      >
        <div
          id={@id}
          data-default-state={@default_state}
          class="rt-BaseDialogOverlay"
          style="inset: 0"
          phx-hook="Dialog"
        >
          <.dialog_content dialog_id={@id} style={@style} class={@class}>
            {render_slot(@inner_block)}
          </.dialog_content>
        </div>
      </div>
    </.portal>
    """
  end

  attr :dialog_id, :string, required: true, doc: "Unique identifier for the dialog"
  attr :style, :string, default: ""
  attr :class, :string, default: ""
  slot :inner_block, required: true

  def dialog_content(assigns) do
    ~H"""
    <div class="rt-BaseDialogScroll">
      <div class="rt-BaseDialogScrollPadding rt-r-align-center">
        <div
          role="alertdialog"
          id={"#{@dialog_id}-content"}
          class={["rt-BaseDialogContent rt-AlertDialogContent rt-r-size-3 rt-r-max-w", @class] |> Enum.filter(& &1 != "") |> Enum.join(" ")}
          tabindex="-1"
          style={["--max-width: 450px; pointer-events: auto;", @style] |> Enum.filter(& &1 != "") |> Enum.join("; ")}
          phx-click-away={JS.dispatch("close", to: "##{@dialog_id}")}
        >
          {render_slot(@inner_block)}
        </div>
      </div>
    </div>
    """
  end
end
