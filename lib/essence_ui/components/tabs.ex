defmodule EssenceUI.Components.Tabs do
  @moduledoc """
  A set of content sections to be displayed one at a time.

  Themed Tabs component with support for various sizes and colors.
  Wraps `EssenceUI.Primitives.Tabs`.

  ## Examples

      <.tabs default_value="account">
        <:list>
          <.tabs_list size="2">
            <:trigger value="account">Account</:trigger>
            <:trigger value="documents">Documents</:trigger>
          </.tabs_list>
        </:list>
        <:content value="account">
          <.text>Make changes to your account here.</.text>
        </:content>
        <:content value="documents">
          <.text>Access and update your documents.</.text>
        </:content>
      </.tabs>

  ## Props

  - `default_value` - Initial active tab value (required)
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control
  """

  use Phoenix.Component

  import EssenceUI.Primitives.Tabs, only: [root: 1, list: 1, trigger: 1, content: 1]

  alias EssenceUI.Helpers.ExtractProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps

  require ColorProps
  require HighContrastProps
  require MarginProps

  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()

  attr :id, :string, default: nil, doc: "Unique identifier for the tabs root."
  attr :default_value, :string, required: true, doc: "Initial active tab value."
  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the root element."

  attr :rest, :global,
    include: ~w(aria-label aria-labelledby aria-describedby),
    doc: "Global attributes and event handlers."

  slot :list, required: true, doc: "Tab list container"

  slot :content, required: true, doc: "Tab content panel" do
    attr :value, :string, required: true, doc: "Tab value to match with trigger"
  end

  def tabs(assigns) do
    prop_defs =
      %{}
      |> Map.merge(ColorProps.color_prop_def())
      |> Map.merge(MarginProps.prop_defs())

    extracted = ExtractProps.call(assigns, prop_defs)

    tabs_id = assigns[:id] || "tabs-#{:erlang.unique_integer([:positive])}"

    assigns =
      assign(assigns,
        tabs_id: tabs_id,
        color: assigns[:color] || false,
        high_contrast: assigns[:high_contrast] || false,
        class: ["est-TabsRoot", extracted.class, assigns[:class]] |> Enum.filter(& &1) |> Enum.join(" "),
        style: extracted.style
      )

    ~H"""
    <.root
      id={@tabs_id}
      default_value={@default_value}
      class={@class}
      style={@style}
      data-accent-color={@color}
      {@rest}
    >
      {render_slot(@list, %{
        tabs_id: @tabs_id,
        default_value: @default_value,
        high_contrast: @high_contrast
      })}

      <.content :for={panel <- @content} value={panel.value} class="est-TabsContent">
        {render_slot(panel)}
      </.content>
    </.root>
    """
  end

  @doc """
  Tab list component containing tab triggers.

  Must be used inside the `:list` slot of the `tabs` component.

  ## Props

  - `size` - Tab size: "1", "2" (default: "2")
  - `high_contrast` - Increase color contrast (default: false)
  """
  attr :size, :string,
    values: ["1", "2"],
    default: "2",
    doc: "Tab size from 1 to 2. Controls overall dimensions."

  HighContrastProps.attrs()
  attr :class, :string, default: nil, doc: "Additional CSS classes"
  attr :tabs_id, :string, default: nil
  attr :default_value, :string, default: nil

  slot :trigger, required: true, doc: "Tab trigger button" do
    attr :value, :string, required: true, doc: "Tab value to match with content"
    attr :disabled, :boolean, doc: "Whether the tab is disabled"
  end

  def tabs_list(assigns) do
    high_contrast = assigns[:high_contrast] || false

    list_class =
      [
        "est-BaseTabList",
        "est-TabsList",
        "est-r-size-#{assigns.size}",
        high_contrast && "est-high-contrast",
        assigns[:class]
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns = assign(assigns, list_class: list_class)

    ~H"""
    <.list class={@list_class}>
      <.trigger
        :for={trig <- @trigger}
        value={trig.value}
        disabled={trig[:disabled] || false}
        class="est-reset est-BaseTabListTrigger est-TabsTrigger"
      >
        <span class="est-BaseTabListTriggerInner est-TabsTriggerInner">
          {render_slot(trig)}
        </span>
        <span class="est-BaseTabListTriggerInnerHidden est-TabsTriggerInnerHidden" aria-hidden="true">
          {render_slot(trig)}
        </span>
      </.trigger>
    </.list>
    """
  end
end
