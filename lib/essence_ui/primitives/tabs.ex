defmodule EssenceUI.Primitives.Tabs do
  @moduledoc false

  use EssenceUI.Primitives

  import Phoenix.HTML, only: [raw: 1]

  @ctx_key {__MODULE__, :ctx_stack}

  attr :id, :string, required: true
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :activation_mode, :string, values: ["automatic", "manual"], default: "automatic"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :on_value_change, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def root(assigns) do
    value_attr = assigns.value || assigns.default_value
    assigns = assign(assigns, :value_attr, value_attr)

    push_ctx(%{
      id: assigns.id,
      value: value_attr,
      orientation: assigns.orientation
    })

    # HEEx defers slot rendering until the Rendered struct is encoded. Evaluate to
    # HTML here so trigger/content still see the process ctx on first paint.
    try do
      html =
        ~H"""
        <div
          id={@id}
          phx-hook="TabsRoot"
          data-essence-tabs-root
          data-value={@value_attr}
          data-orientation={@orientation}
          data-activation-mode={@activation_mode}
          data-on-value-change={@on_value_change}
          dir={@dir}
          {@rest}
        >
          {render_slot(@inner_block)}
        </div>
        """
        |> Phoenix.HTML.Safe.to_iodata()
        |> IO.iodata_to_binary()

      assigns = assign(assigns, :html, html)

      ~H"""
      {raw(@html)}
      """
    after
      pop_ctx()
    end
  end

  attr :loop, :boolean, default: true
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :rest, :global
  slot :inner_block, required: true

  def list(assigns) do
    ctx = current_ctx()
    orientation = (ctx && ctx.orientation) || assigns.orientation
    assigns = assign(assigns, :orientation, orientation)

    ~H"""
    <div
      role="tablist"
      aria-orientation={@orientation}
      data-essence-tabs-list
      data-orientation={@orientation}
      data-loop={to_string(@loop)}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :rest, :global
  slot :inner_block, required: true

  def trigger(assigns) do
    ctx = current_ctx()
    active? = match_value?(ctx, assigns.value)
    orientation = (ctx && ctx.orientation) || assigns.orientation
    root_id = ctx && ctx.id

    assigns =
      assigns
      |> assign(:active?, active?)
      |> assign(:orientation, orientation)
      |> assign(:aria_controls, content_id(root_id, assigns.value))
      |> assign(:id, assigns.id || trigger_id(root_id, assigns.value))

    ~H"""
    <button
      id={@id}
      type="button"
      role="tab"
      data-essence-tabs-trigger
      data-value={@value}
      data-state={if @active?, do: "active", else: "inactive"}
      data-orientation={@orientation}
      data-disabled={if @disabled, do: ""}
      data-radix-collection-item=""
      aria-selected={if @active?, do: "true", else: "false"}
      aria-controls={@aria_controls}
      tabindex={if @active?, do: "0", else: "-1"}
      disabled={@disabled}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :force_mount, :boolean, default: false
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :rest, :global
  slot :inner_block, required: true

  def content(assigns) do
    ctx = current_ctx()
    active? = match_value?(ctx, assigns.value)
    orientation = (ctx && ctx.orientation) || assigns.orientation
    root_id = ctx && ctx.id

    assigns =
      assigns
      |> assign(:active?, active?)
      |> assign(:orientation, orientation)
      |> assign(:aria_labelledby, trigger_id(root_id, assigns.value))
      |> assign(:id, assigns.id || content_id(root_id, assigns.value))

    ~H"""
    <div
      id={@id}
      role="tabpanel"
      data-essence-tabs-content
      data-value={@value}
      data-state={if @active?, do: "active", else: "inactive"}
      data-orientation={@orientation}
      data-force-mount={if @force_mount, do: ""}
      aria-labelledby={@aria_labelledby}
      tabindex="0"
      hidden={!@active?}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  defp match_value?(%{value: active}, value) when is_binary(active), do: active == value
  defp match_value?(_, _), do: false

  defp trigger_id(nil, _value), do: nil
  defp trigger_id(root_id, value), do: "#{root_id}-trigger-#{value}"

  defp content_id(nil, _value), do: nil
  defp content_id(root_id, value), do: "#{root_id}-content-#{value}"

  defp push_ctx(ctx) do
    stack = Process.get(@ctx_key, [])
    Process.put(@ctx_key, [ctx | stack])
  end

  defp pop_ctx do
    case Process.get(@ctx_key, []) do
      [_ | rest] -> Process.put(@ctx_key, rest)
      [] -> Process.delete(@ctx_key)
    end
  end

  defp current_ctx do
    case Process.get(@ctx_key, []) do
      [ctx | _] -> ctx
      [] -> nil
    end
  end
end
