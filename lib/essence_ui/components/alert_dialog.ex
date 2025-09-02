defmodule EssenceUI.Components.AlertDialog do
  @moduledoc false
  use Phoenix.Component

  import EssenceUI.Components, only: [dialog: 1, heading: 1, text: 1]

  attr :id, :string, required: true, doc: "Unique identifier for the alert dialog"
  attr :target, :string, required: true, doc: "The target element to attach the dialog to"

  attr :default_state, :string,
    default: "closed",
    values: ["open", "closed"],
    doc: "The default state of the dialog (open/closed)"

  slot :title
  slot :content
  slot :inner_block

  def alert_dialog(assigns) do
    ~H"""
    <.dialog id={@id} target={@target} default_state={@default_state}>
      <.heading :if={@title} as="h1" size="5" mb="3">
        {render_slot(@title)}
      </.heading>
      <.text :if={@description}>
        {render_slot(@description)}
      </.text>
      {render_slot(@inner_block)}
    </.dialog>
    """
  end
end
