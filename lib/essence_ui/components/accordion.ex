defmodule EssenceUI.Components.Accordion do
  @moduledoc """
  A vertically stacked set of interactive headings that each reveal an associated section of content.

  Based on EssenceUI.Primitives.Accordion.
  """
  use Phoenix.Component

  alias EssenceUI.Primitives.Accordion, as: Primitive
  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  MarginProps.attrs()

  attr :type, :string, values: ["single", "multiple"], default: "single"
  attr :collapsible, :boolean, default: false
  attr :default_value, :any, default: nil, doc: "A string for type='single' or a list of strings for type='multiple'"
  attr :orientation, :string, values: ["vertical", "horizontal"], default: "vertical"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
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

    default_values =
      case assigns[:default_value] do
        nil -> []
        val when is_list(val) -> val
        val -> [val]
      end

    assigns =
      assign(assigns,
        accordion_id: accordion_id,
        class: extracted.class,
        style: extracted.style,
        default_values: default_values
      )

    ~H"""
    <Primitive.root
      id={@accordion_id}
      type={@type}
      collapsible={@collapsible}
      orientation={@orientation}
      dir={@dir}
      class={["AccordionRoot", @class]}
      style={@style}
      {@rest}
    >
      <%= for item <- @item do %>
        <%
          is_open = item.value in @default_values
          state = if is_open, do: "open", else: "closed"
          # Unique IDs for ARIA and hooks
          root_id = "#{@accordion_id}-item-#{item.value}"
          content_id = "#{@accordion_id}-content-#{item.value}"
          trigger_id = "#{@accordion_id}-trigger-#{item.value}"
        %>
        <Primitive.item
          id={root_id}
          value={item.value}
          disabled={item[:disabled] || false}
          open={is_open}
          class="AccordionItem"
        >
          {render_slot(item, %{state: state, id: content_id, trigger_id: trigger_id})}
        </Primitive.item>
      <% end %>
    </Primitive.root>
    """
  end

  @doc """
  The header component for an accordion item.
  """
  attr :class, :string, default: nil
  attr :id, :string, default: nil
  slot :inner_block, required: true

  def accordion_header(assigns) do
    ~H"""
    <Primitive.header id={@id} class={["AccordionHeader", @class]}>
      {render_slot(@inner_block)}
    </Primitive.header>
    """
  end

  @doc """
  The trigger component that toggles the accordion item.
  """
  attr :class, :string, default: nil
  attr :state, :string, doc: "Passed from item slot"
  attr :id, :string, required: true, doc: "Passed from item slot"
  attr :trigger_id, :string, required: true, doc: "Passed from item slot"
  slot :inner_block, required: true

  def accordion_trigger(assigns) do
    ~H"""
    <Primitive.trigger
      id={@id}
      trigger_id={@trigger_id}
      class={["AccordionTrigger", @class]}
      data-state={@state}
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
    </Primitive.trigger>
    """
  end

  @doc """
  The content component that is revealed when the accordion item is open.
  """
  attr :class, :string, default: nil
  attr :state, :string, doc: "Passed from item slot"
  attr :id, :string, required: true, doc: "Passed from item slot"
  attr :trigger_id, :string, required: true, doc: "Passed from item slot"
  slot :inner_block, required: true

  def accordion_content(assigns) do
    ~H"""
    <Primitive.content
      id={@id}
      aria-labelledby={@trigger_id}
      class={["AccordionContent", @class]}
      data-state={@state}
    >
      <div class="AccordionContentText">
        {render_slot(@inner_block)}
      </div>
    </Primitive.content>
    """
  end
end
