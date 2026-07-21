defmodule EssenceUI.Primitives.Toast do
  @moduledoc false

  use EssenceUI.Primitives

  @doc """
  Provider that wraps toasts and the viewport. Supplies default duration,
  swipe direction, and announcement label via data attributes.
  """
  attr :duration, :integer, default: 5000
  attr :swipe_direction, :string, default: "right", values: ["right", "left", "up", "down"]
  attr :label, :string, default: "Notification"
  attr :rest, :global
  slot :inner_block, required: true

  def provider(assigns) do
    ~H"""
    <div
      data-essence-toast-provider
      data-duration={@duration}
      data-swipe-direction={@swipe_direction}
      data-label={@label}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  An individual toast. Auto-dismisses after `duration` (or the provider default).
  """
  attr :id, :string, required: true
  attr :open, :boolean, default: nil
  attr :default_open, :boolean, default: true
  attr :type, :string, default: "foreground", values: ["foreground", "background"]
  attr :duration, :integer, default: nil
  attr :on_open_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    open? =
      case assigns.open do
        nil -> assigns.default_open
        open -> open
      end

    state = if open?, do: "open", else: "closed"

    assigns =
      assigns
      |> assign(:state, state)
      |> assign(:open?, open?)

    ~H"""
    <div
      id={@id}
      phx-hook="ToastRoot"
      role="status"
      aria-live={if @type == "foreground", do: "assertive", else: "polite"}
      aria-atomic="true"
      tabindex="0"
      data-essence-toast-root
      data-state={@state}
      data-type={@type}
      data-duration={@duration}
      data-default-open={to_string(@default_open)}
      data-on-open-change={@on_open_change}
      hidden={not @open?}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  An optional title for the toast.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def title(assigns) do
    ~H"""
    <div data-essence-toast-title {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  The toast description / body text.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def description(assigns) do
    ~H"""
    <div data-essence-toast-description {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  A button that performs an action related to the toast.
  `alt_text` describes an alternative way to perform the action for screen readers.
  """
  attr :alt_text, :string, required: true
  attr :rest, :global
  slot :inner_block, required: true

  def action(assigns) do
    ~H"""
    <button type="button" data-essence-toast-action data-alt-text={@alt_text} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  @doc """
  A button that closes the toast.
  """
  attr :rest, :global
  slot :inner_block, required: true

  def close(assigns) do
    ~H"""
    <button type="button" data-essence-toast-close {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  @doc """
  The region that holds toasts. Users can jump here with the configured hotkey (F8 by default).
  """
  attr :id, :string, default: nil
  attr :hotkey, :string, default: "F8"
  attr :label, :string, default: "Notifications ({hotkey})"
  attr :rest, :global
  slot :inner_block

  def viewport(assigns) do
    label = String.replace(assigns.label, "{hotkey}", assigns.hotkey)
    assigns = assign(assigns, :resolved_label, label)

    ~H"""
    <div
      id={@id}
      phx-hook="ToastViewport"
      tabindex="-1"
      role="region"
      data-essence-toast-viewport
      data-hotkey={@hotkey}
      data-label={@resolved_label}
      aria-label={@resolved_label}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
