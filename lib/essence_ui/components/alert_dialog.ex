defmodule EssenceUI.Components.AlertDialog do
  @moduledoc false
  use Phoenix.Component

  import EssenceUI.Components, only: [dialog: 1, heading: 1, text: 1]

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
    assigns = assign_new(assigns, :radius, fn -> "medium" end)

    ~H"""
    <.dialog
      id={@id}
      target={@target}
      default_state={@default_state}
      style={@style}
      class={@class}
      scaling={@scaling}
      radius={@radius}
      gray_color={@gray_color}
      accent_color={@accent_color}
    >
      <div class="rt-AlertDialogContent">
        <.heading :if={@title != []} as="h1" size="5" mb="3">
          {render_slot(@title)}
        </.heading>
        <.text :if={@description != []} as="p" size="2" mb="4">
          {render_slot(@description)}
        </.text>
        {render_slot(@inner_block)}
      </div>
    </.dialog>
    """
  end
end
