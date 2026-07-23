defmodule EssenceUI.Components.Tabs do
  @moduledoc """
  Tabs component styled per Radix Themes Tabs.

  Wraps `EssenceUI.Primitives.Tabs` with Themes parts:
  `tabs_root/1`, `tabs_list/1`, `tabs_trigger/1`, `tabs_content/1`.

  ## Examples

      <.tabs_root id="account-tabs" default_value="account">
        <.tabs_list size="2">
          <.tabs_trigger value="account">Account</.tabs_trigger>
          <.tabs_trigger value="documents">Documents</.tabs_trigger>
          <.tabs_trigger value="settings">Settings</.tabs_trigger>
        </.tabs_list>
        <.tabs_content value="account">
          <.text>Make changes to your account here.</.text>
        </.tabs_content>
        <.tabs_content value="documents">
          <.text>Access and update your documents.</.text>
        </.tabs_content>
        <.tabs_content value="settings">
          <.text>Manage your account settings.</.text>
        </.tabs_content>
      </.tabs_root>
  """

  use Phoenix.Component

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.Primitives.Tabs, as: TabsPrimitive
  alias EssenceUI.SharedProps.MarginProps

  require MarginProps

  @sizes ["1", "2"]

  @doc """
  Tabs root container.
  """
  attr :id, :string, required: true
  attr :value, :string, default: nil
  attr :default_value, :string, default: nil
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :activation_mode, :string, values: ["automatic", "manual"], default: "automatic"
  attr :dir, :string, values: ["ltr", "rtl"], default: "ltr"
  attr :on_value_change, :string, default: nil
  attr :class, :string, default: nil
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def tabs_root(assigns) do
    extracted = ExtractProps.call(assigns, MarginProps.prop_defs())

    class =
      ["rt-TabsRoot", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class, style: extracted.style)

    ~H"""
    <TabsPrimitive.root
      id={@id}
      value={@value}
      default_value={@default_value}
      orientation={@orientation}
      activation_mode={@activation_mode}
      dir={@dir}
      on_value_change={@on_value_change}
      class={@class}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </TabsPrimitive.root>
    """
  end

  @doc """
  Tab list containing triggers.
  """
  attr :size, :string, values: @sizes, default: "2"
  attr :color, :string, default: nil
  attr :high_contrast, :boolean, default: false
  attr :loop, :boolean, default: true
  attr :class, :string, default: nil
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def tabs_list(assigns) do
    prop_defs =
      %{
        size: %{type: :enum, class: "rt-r-size", values: @sizes, default: "2", responsive: true},
        high_contrast: %{type: :boolean, class: "rt-high-contrast"}
      }
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    class =
      ["rt-BaseTabList", "rt-TabsList", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class, style: extracted.style, color: assigns[:color])

    ~H"""
    <TabsPrimitive.list
      loop={@loop}
      class={@class}
      style={@style}
      data-accent-color={@color}
      {@rest}
    >
      {render_slot(@inner_block)}
    </TabsPrimitive.list>
    """
  end

  @doc """
  Tab trigger button with Themes Inner / InnerHidden spans.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :disabled, :boolean, default: false
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def tabs_trigger(assigns) do
    class =
      ["rt-reset", "rt-BaseTabListTrigger", "rt-TabsTrigger", assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class)

    ~H"""
    <TabsPrimitive.trigger id={@id} value={@value} disabled={@disabled} class={@class} {@rest}>
      <span class="rt-BaseTabListTriggerInner rt-TabsTriggerInner">
        {render_slot(@inner_block)}
      </span>
      <span class="rt-BaseTabListTriggerInnerHidden rt-TabsTriggerInnerHidden" aria-hidden="true">
        {render_slot(@inner_block)}
      </span>
    </TabsPrimitive.trigger>
    """
  end

  @doc """
  Tab content panel.
  """
  attr :id, :string, default: nil
  attr :value, :string, required: true
  attr :force_mount, :boolean, default: false
  attr :class, :string, default: nil
  MarginProps.attrs()
  attr :rest, :global
  slot :inner_block, required: true

  def tabs_content(assigns) do
    extracted = ExtractProps.call(assigns, MarginProps.prop_defs())

    class =
      ["rt-TabsContent", extracted.class, assigns[:class]]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, class: class, style: extracted.style)

    ~H"""
    <TabsPrimitive.content
      id={@id}
      value={@value}
      force_mount={@force_mount}
      class={@class}
      style={@style}
      {@rest}
    >
      {render_slot(@inner_block)}
    </TabsPrimitive.content>
    """
  end
end
