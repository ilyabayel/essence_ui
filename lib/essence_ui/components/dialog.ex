defmodule EssenceUI.Components.Dialog do
  @moduledoc """
  Dialog component compatible with Radix UI Themes Dialog API.

  Based on EssenceUI.Primitives.Dialog.
  See: https://www.radix-ui.com/themes/docs/components/dialog
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.Dialog, as: DialogPrimitive

  @sizes ["1", "2", "3", "4"]
  @aligns ["start", "center"]

  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :default_open, :boolean, default: false
  attr :on_open_change, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dialog_root(assigns) do
    ~H"""
    <DialogPrimitive.root
      id={@id}
      open={@open}
      default_open={@default_open}
      modal={true}
      on_open_change={@on_open_change}
      class={@class}
      {@rest}
    >
      {render_slot(@inner_block)}
    </DialogPrimitive.root>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dialog_trigger(assigns) do
    ~H"""
    <DialogPrimitive.trigger id={@id} class={@class} as_child {@rest}>
      {render_slot(@inner_block)}
    </DialogPrimitive.trigger>
    """
  end

  attr :id, :string, required: true, doc: "Content element id (also used to derive portal id)"
  attr :target, :string, default: "body", doc: "Portal target CSS selector"
  attr :size, :string, values: @sizes, default: "3"
  attr :align, :string, values: @aligns, default: "center"
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dialog_content(assigns) do
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
      ["rt-BaseDialogContent", "rt-DialogContent", extracted.class, assigns[:class]]
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
    <DialogPrimitive.portal id={@portal_id} target={@target}>
      <DialogPrimitive.overlay class="rt-BaseDialogOverlay rt-DialogOverlay">
        <div class="rt-BaseDialogScroll rt-DialogScroll">
          <div class={["rt-BaseDialogScrollPadding rt-DialogScrollPadding", @align_class]}>
            <DialogPrimitive.content id={@id} class={@class} style={@style} {@rest}>
              {render_slot(@inner_block)}
            </DialogPrimitive.content>
          </div>
        </div>
      </DialogPrimitive.overlay>
    </DialogPrimitive.portal>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dialog_title(assigns) do
    class =
      ["rt-DialogTitle", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <DialogPrimitive.title id={@id} class={@class} {@rest}>
      {render_slot(@inner_block)}
    </DialogPrimitive.title>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dialog_description(assigns) do
    class =
      ["rt-DialogDescription", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <DialogPrimitive.description id={@id} class={@class} {@rest}>
      {render_slot(@inner_block)}
    </DialogPrimitive.description>
    """
  end

  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dialog_close(assigns) do
    ~H"""
    <DialogPrimitive.close id={@id} class={@class} as_child {@rest}>
      {render_slot(@inner_block)}
    </DialogPrimitive.close>
    """
  end
end
