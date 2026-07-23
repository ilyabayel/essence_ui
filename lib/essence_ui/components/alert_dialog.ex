defmodule EssenceUI.Components.AlertDialog do
  @moduledoc """
  AlertDialog component compatible with Radix UI Themes AlertDialog API.

  Based on EssenceUI.Primitives.AlertDialog.
  See: https://www.radix-ui.com/themes/docs/components/alert-dialog
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.AlertDialog, as: AlertDialogPrimitive

  @sizes ["1", "2", "3", "4"]
  @aligns ["start", "center"]

  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :on_open_change, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def alert_dialog_root(assigns) do
    ~H"""
    <AlertDialogPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      on_open_change={@on_open_change}
      class={@class}
      {@rest}
    >
      {render_slot(@inner_block)}
    </AlertDialogPrimitive.root>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def alert_dialog_trigger(assigns) do
    ~H"""
    <AlertDialogPrimitive.trigger id={@id} class={@class} as_child {@rest}>
      {render_slot(@inner_block)}
    </AlertDialogPrimitive.trigger>
    """
  end

  attr :id, :string, required: true
  attr :target, :string, default: "body"
  attr :size, :string, values: @sizes, default: "3"
  attr :align, :string, values: @aligns, default: "center"
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def alert_dialog_content(assigns) do
    prop_defs = %{
      size: %{type: :enum, values: @sizes, class: "rt-r-size", default: "3"}
    }

    extracted = ExtractProps.call(assigns, prop_defs)

    align_class =
      case assigns.align do
        "start" -> "rt-r-align-start"
        _ -> "rt-r-align-center"
      end

    class =
      ["rt-BaseDialogContent", "rt-AlertDialogContent", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        class: class,
        style: [extracted.style, assigns[:style]] |> Enum.filter(& &1) |> Enum.join(" "),
        align_class: align_class,
        portal_id: "#{assigns.id}-portal"
      )

    ~H"""
    <AlertDialogPrimitive.portal id={@portal_id} target={@target}>
      <AlertDialogPrimitive.overlay class="rt-BaseDialogOverlay rt-AlertDialogOverlay">
        <div class="rt-BaseDialogScroll rt-AlertDialogScroll">
          <div class={["rt-BaseDialogScrollPadding rt-AlertDialogScrollPadding", @align_class]}>
            <AlertDialogPrimitive.content id={@id} class={@class} style={@style} {@rest}>
              {render_slot(@inner_block)}
            </AlertDialogPrimitive.content>
          </div>
        </div>
      </AlertDialogPrimitive.overlay>
    </AlertDialogPrimitive.portal>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def alert_dialog_title(assigns) do
    class =
      ["rt-AlertDialogTitle", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <AlertDialogPrimitive.title id={@id} class={@class} {@rest}>
      {render_slot(@inner_block)}
    </AlertDialogPrimitive.title>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def alert_dialog_description(assigns) do
    class =
      ["rt-AlertDialogDescription", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <AlertDialogPrimitive.description id={@id} class={@class} {@rest}>
      {render_slot(@inner_block)}
    </AlertDialogPrimitive.description>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def alert_dialog_action(assigns) do
    ~H"""
    <AlertDialogPrimitive.action id={@id} class={@class} as_child {@rest}>
      {render_slot(@inner_block)}
    </AlertDialogPrimitive.action>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def alert_dialog_cancel(assigns) do
    ~H"""
    <AlertDialogPrimitive.cancel id={@id} class={@class} as_child {@rest}>
      {render_slot(@inner_block)}
    </AlertDialogPrimitive.cancel>
    """
  end
end
