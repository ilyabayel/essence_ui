defmodule EssenceUI.Primitives.Select do
  @moduledoc """
  Select primitive based on Radix UI Select.
  """
  use EssenceUI.Primitives

  @doc """
  The root container for the select component.
  """
  attr :id, :string, required: true
  attr :value, :string, default: nil, doc: "The value of the select."
  attr :on_change, :string, default: nil, doc: "Event to push when value changes."
  attr :disabled, :boolean, default: false
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :name, :string, default: nil
  attr :required, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <div
      id={@id}
      phx-hook="SelectRoot"
      data-essence-select-root
      data-value={@value}
      data-disabled={if @disabled, do: "", else: nil}
      dir={@dir}
      {@rest}
    >
      {render_slot(@inner_block)}
      <%= if @name do %>
        <input type="hidden" name={@name} value={@value} required={@required} disabled={@disabled} />
      <% end %>
    </div>
    """
  end

  @doc """
  The button that toggles the select.
  """
  attr :id, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    assigns = assign_new(assigns, :id, fn -> "select-trigger-#{System.unique_integer([:positive])}" end)

    ~H"""
    <button
      type="button"
      id={@id}
      data-essence-select-trigger
      role="combobox"
      aria-haspopup="listbox"
      aria-expanded="false"
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  @doc """
  The value displayed in the trigger.
  """
  attr :placeholder, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def value(assigns) do
    ~H"""
    <span data-essence-select-value {@rest}>
      {render_slot(@inner_block) || @placeholder}
    </span>
    """
  end

  @doc """
  A decorative icon for the trigger.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def icon(assigns) do
    ~H"""
    <span data-essence-select-icon aria-hidden="true" {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end

  @doc """
  A portal that renders the select content into a target container via Phoenix.Component.portal.
  """
  attr :id, :string, required: true
  attr :target, :string, default: "body"
  slot :inner_block, required: true

  def portal(assigns) do
    ~H"""
    <Phoenix.Component.portal id={@id} target={@target}>
      <div data-essence-select-portal>
        {render_slot(@inner_block)}
      </div>
    </Phoenix.Component.portal>
    """
  end

  @doc """
  The content that pops out when the select is open.
  """
  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    assigns = assign_new(assigns, :id, fn -> "select-content-#{System.unique_integer([:positive])}" end)

    ~H"""
    <div
      id={@id}
      data-essence-select-content
      role="listbox"
      tabindex="-1"
      style="display: none; position: fixed; z-index: 50;"
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  A button that scrolls the viewport up.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def scroll_up_button(assigns) do
    ~H"""
    <div data-essence-select-scroll-up-button aria-hidden="true" {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  A button that scrolls the viewport down.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def scroll_down_button(assigns) do
    ~H"""
    <div data-essence-select-scroll-down-button aria-hidden="true" {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  The viewport that contains the select items.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def viewport(assigns) do
    ~H"""
    <div data-essence-select-viewport {@rest} style="overflow-y: auto; flex: 1;">
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  An optional arrow that points to the trigger.
  """
  attr :rest, :global

  def arrow(assigns) do
    ~H"""
    <div data-essence-select-arrow aria-hidden="true" {@rest}></div>
    """
  end

  @doc """
  An item in the select.
  """
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :text_value, :string, default: nil, doc: "Optional text value for type-to-select."
  attr :rest, :global
  slot :inner_block, required: true

  def item(assigns) do
    ~H"""
    <div
      role="option"
      data-essence-select-item
      data-value={@value}
      data-disabled={if @disabled, do: "", else: nil}
      data-text-value={@text_value}
      tabindex="-1"
      aria-selected="false"
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  The text content of an item.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def item_text(assigns) do
    ~H"""
    <span data-essence-select-item-text {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end

  @doc """
  An indicator shown when the item is selected.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def item_indicator(assigns) do
    ~H"""
    <span data-essence-select-item-indicator aria-hidden="true" style="display: none;" {@rest}>
      {render_slot(@inner_block)}
    </span>
    """
  end

  @doc """
  A group of items.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def group(assigns) do
    ~H"""
    <div role="group" data-essence-select-group {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  A label for a group.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <div data-essence-select-label {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  A separator between items or groups.
  """
  attr :rest, :global

  def separator(assigns) do
    ~H"""
    <div role="separator" data-essence-select-separator aria-hidden="true" {@rest}></div>
    """
  end
end
