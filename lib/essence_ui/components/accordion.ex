defmodule EssenceUI.Components.Accordion do
  @moduledoc """
  A vertically stacked set of interactive headings that each reveal an associated section of content.

  Based on Radix UI Accordion primitive.
  """
  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  MarginProps.attrs()

  attr :type, :string, values: ["single", "multiple"], default: "single"
  attr :collapsible, :boolean, default: false
  attr :default_value, :string, default: nil
  attr :id, :string, default: nil
  attr :class, :string, default: nil
  attr :style, :string, default: nil
  attr :rest, :global

  slot :item, required: true do
    attr :value, :string, required: true
    attr :disabled, :boolean
  end

  def accordion(assigns) do
    accordion_id = assigns[:id] || "accordion-#{:erlang.unique_integer([:positive])}"

    prop_defs = MarginProps.prop_defs()
    extracted = ExtractProps.call(assigns, prop_defs)

    assigns =
      assign(assigns,
        accordion_id: accordion_id,
        class: extracted.class,
        style: extracted.style
      )

    ~H"""
    <div
      id={@accordion_id}
      class={["AccordionRoot", @class]}
      style={@style}
      data-type={@type}
      data-collapsible={to_string(@collapsible)}
      phx-hook="Accordion"
      {@rest}
    >
      <%= for item <- @item do %>
        <% state = if item.value == @default_value, do: "open", else: "closed" %>
        <div class="AccordionItem" data-state={state} data-disabled={if item[:disabled], do: "true"}>
          {render_slot(item, %{state: state})}
        </div>
      <% end %>
    </div>
    """
  end

  @doc """
  The header component for an accordion item.
  """
  attr :class, :string, default: nil
  slot :inner_block, required: true

  def accordion_header(assigns) do
    ~H"""
    <h3 class={["AccordionHeader", @class]}>
      {render_slot(@inner_block)}
    </h3>
    """
  end

  @doc """
  The trigger component that toggles the accordion item.
  """
  attr :class, :string, default: nil
  attr :state, :string, doc: "Passed from item slot"
  slot :inner_block, required: true

  def accordion_trigger(assigns) do
    ~H"""
    <button
      type="button"
      class={["AccordionTrigger", @class]}
      data-state={@state}
      aria-expanded={if @state == "open", do: "true", else: "false"}
    >
      <span>{render_slot(@inner_block)}</span>
      <svg
        class="AccordionChevron"
        width="15"
        height="15"
        viewBox="0 0 15 15"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        aria-hidden
      >
        <path
          d="M3.13523 6.15803C3.3241 5.95657 3.64057 5.94637 3.84203 6.13523L7.5 9.56464L11.158 6.13523C11.3594 5.94637 11.6759 5.95657 11.8648 6.15803C12.0536 6.35949 12.0434 6.67597 11.842 6.86484L7.84199 10.6148C7.64491 10.7996 7.35509 10.7996 7.15801 10.6148L3.15801 6.86484C2.95655 6.67597 2.94635 6.35949 3.13523 6.15803Z"
          fill="currentColor"
          fill-rule="evenodd"
          clip-rule="evenodd"
        >
        </path>
      </svg>
    </button>
    """
  end

  @doc """
  The content component that is revealed when the accordion item is open.
  """
  attr :class, :string, default: nil
  attr :state, :string, doc: "Passed from item slot"
  slot :inner_block, required: true

  def accordion_content(assigns) do
    ~H"""
    <div class={["AccordionContent", @class]} data-state={@state}>
      <div class="AccordionContentText">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end
end
