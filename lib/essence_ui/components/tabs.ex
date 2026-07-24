defmodule EssenceUI.Components.Tabs do
  @moduledoc """
  A set of content sections to be displayed one at a time.

  Based on Radix UI Themes Tabs component with support for various sizes and colors.
  The Tabs component uses client-side JavaScript to handle tab switching for smooth
  interactions without server round-trips.

  ## Examples

      <.tabs default_value="account">
        <:list>
          <.tabs_list size="2">
            <:trigger value="account">Account</:trigger>
            <:trigger value="documents">Documents</:trigger>
            <:trigger value="settings">Settings</:trigger>
          </.tabs_list>
        </:list>
        <:content value="account">
          <.text>Make changes to your account here.</.text>
        </:content>
        <:content value="documents">
          <.text>Access and update your documents.</.text>
        </:content>
        <:content value="settings">
          <.text>Manage your account settings.</.text>
        </:content>
      </.tabs>

      <.tabs default_value="overview" color="blue">
        <:list>
          <.tabs_list size="1">
            <:trigger value="overview">Overview</:trigger>
            <:trigger value="details">Details</:trigger>
          </.tabs_list>
        </:list>
        <:content value="overview">
          Overview content
        </:content>
        <:content value="details">
          Details content
        </:content>
      </.tabs>

  ## Props

  - `default_value` - Initial active tab value (required)
  - `color` - Color theme from accent color palette (default: none)
  - `high_contrast` - Increase color contrast (default: false)
  - Plus margin props (m, mx, my, mt, mr, mb, ml) for spacing control

  ## Accessibility

  - Uses proper ARIA roles and attributes
  - Keyboard navigation with arrow keys
  - Focus management
  """

  use Phoenix.Component

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

  attr :default_value, :string,
    required: true,
    doc: "Initial active tab value."

  attr :class, :string, default: nil, doc: "Additional CSS classes to add to the root element."

  attr :rest, :global,
    include: ~w(id aria-label aria-labelledby aria-describedby),
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

    # Generate unique ID for this tabs instance
    tabs_id = assigns[:id] || "tabs-#{:erlang.unique_integer([:positive])}"

    assigns =
      assign(assigns,
        tabs_id: tabs_id,
        color: assigns[:color] || false,
        high_contrast: assigns[:high_contrast] || false,
        class: ["rt-TabsRoot", extracted.class, assigns[:class]] |> Enum.filter(& &1) |> Enum.join(" "),
        style: extracted.style
      )

    ~H"""
    <div
      id={@tabs_id}
      dir="ltr"
      data-orientation="horizontal"
      class={@class}
      style={@style}
      data-accent-color={@color}
      {@rest}
      phx-hook="Tabs"
    >
      {render_slot(@list, %{
        tabs_id: @tabs_id,
        default_value: @default_value,
        high_contrast: @high_contrast
      })}

      <%= for content <- @content do %>
        <div
          data-state={if(content.value == @default_value, do: "active", else: "inactive")}
          data-orientation="horizontal"
          role="tabpanel"
          aria-labelledby={"#{@tabs_id}-trigger-#{content.value}"}
          id={"#{@tabs_id}-content-#{content.value}"}
          tabindex="0"
          class="rt-TabsContent"
          hidden={content.value != @default_value}
        >
          {render_slot(content)}
        </div>
      <% end %>
    </div>
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

  slot :trigger, required: true, doc: "Tab trigger button" do
    attr :value, :string, required: true, doc: "Tab value to match with content"
    attr :disabled, :boolean, doc: "Whether the tab is disabled"
  end

  def tabs_list(assigns) do
    # Get context from parent slot
    tabs_id = assigns[:tabs_id]
    default_value = assigns[:default_value]
    high_contrast = assigns[:high_contrast] || false

    # Build CSS classes for list
    list_class =
      [
        "rt-BaseTabList",
        "rt-TabsList",
        "rt-r-size-#{assigns.size}",
        high_contrast && "rt-high-contrast",
        assigns[:class]
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assign(assigns,
        list_class: list_class,
        tabs_id: tabs_id,
        default_value: default_value
      )

    ~H"""
    <div
      class={@list_class}
      role="tablist"
      aria-orientation="horizontal"
      data-orientation="horizontal"
      data-default-value={@default_value}
      data-tabs-id={@tabs_id}
      tabindex="0"
    >
      <%= for trigger <- @trigger do %>
        <button
          type="button"
          role="tab"
          class="rt-reset rt-BaseTabListTrigger rt-TabsTrigger"
          data-value={trigger.value}
          data-state={if(trigger.value == @default_value, do: "active", else: "inactive")}
          aria-selected={if(trigger.value == @default_value, do: "true", else: "false")}
          aria-controls={"#{@tabs_id}-content-#{trigger.value}"}
          id={"#{@tabs_id}-trigger-#{trigger.value}"}
          tabindex={if(trigger.value == @default_value, do: "0", else: "-1")}
          data-orientation="horizontal"
          data-radix-collection-item=""
          disabled={trigger[:disabled]}
        >
          <span class="rt-BaseTabListTriggerInner rt-TabsTriggerInner">
            {render_slot(trigger)}
          </span>
          <span class="rt-BaseTabListTriggerInnerHidden rt-TabsTriggerInnerHidden" aria-hidden="true">
            {render_slot(trigger)}
          </span>
        </button>
      <% end %>
    </div>
    """
  end
end
