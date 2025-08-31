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

  attr :open, :boolean, default: false, doc: "Whether the dialog is open"
  attr :modal, :boolean, default: true, doc: "Whether the dialog is modal"
  attr :id, :string, default: nil, doc: "Unique identifier for the dialog"
  slot :inner_block, required: true

  def dialog(assigns) do
    ~H"""
    <div id={@id} phx-hook="Dialog" class="rt-Dialog">
      <.dialog_overlay id={@id <> "Overlay"} />
      <.dialog_content>
        {render_slot(@inner_block)}
      </.dialog_content>
    </div>
    """
  end

  attr :id, :string, default: nil, doc: "Unique identifier for the dialog"

  def dialog_overlay(assigns) do
    ~H"""
    <div class="rt-DialogOverlay" id={@id} phx-click={JS.dispatch("close", to: "#{@id}")}>
      <div class="rt-DialogOverlayBackdrop" />
    </div>
    """
  end

  def dialog_content(assigns) do
    ~H"""
    <div class="rt-DialogContent">
      {render_slot(@inner_block)}
    </div>
    """
  end
end
