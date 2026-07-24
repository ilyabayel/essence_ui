# Story templates

Copy-paste skeletons for Essence UI Storybook. See [SKILL.md](SKILL.md) for rules.

## 1. Primitive (`:component`)

```elixir
defmodule Storybook.Primitives.WidgetStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Widget

  def function, do: &Widget.root/1

  def container,
    do:
      {:div,
       class: "radix-demo",
       "data-component": "widget"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless widget primitive",
        template: """
        <Widget.root
          id="widget-primitive"
          class="WidgetRoot"
        >
          <Widget.trigger
            id="widget-trigger"
            class="WidgetTrigger"
          >
            Open
          </Widget.trigger>
        </Widget.root>
        """
      }
    ]
  end
end
```

Separator exception: `def container, do: :iframe` and keep the `radix-demo` wrapper **inside** the template.

## 2. Themes component (`:component`)

```elixir
defmodule Storybook.Themes.Components.WidgetStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Widget

  def function, do: &Widget.widget/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def imports, do: [{Widget, [widget_part: 1]}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default widget",
        template: """
        <.widget id="widget-default">
          <.widget_part>Content</.widget_part>
        </.widget>
        """
      },
      %VariationGroup{
        id: :sizes,
        description: "Sizes",
        variations: [
          %Variation{id: :size_1, attributes: %{size: "1"}, slots: ["Size 1"]},
          %Variation{id: :size_2, attributes: %{size: "2"}, slots: ["Size 2"]}
        ]
      }
    ]
  end
end
```

Typography / layout / utilities: same shape, but keep that folder’s thinner container attr set (do not force all five).

## 3. Example (`:example`)

```elixir
defmodule Storybook.Examples.WidgetDemoStory do
  @moduledoc false
  use PhoenixStorybook.Story, :example

  import EssenceUI.Components, except: [quote: 1]

  @impl true
  def render(assigns) do
    ~H"""
    <div
      data-scaling="100%"
      data-radius="medium"
      style="display: block; min-height: 100vh; padding: 20px;"
      data-gray-color="slate"
      data-accent-color="indigo"
      class="essence-ui"
    >
      <.flex
        direction="column"
        gap="4"
      >
        <.heading size="5">Widget demo</.heading>
        <%!-- composition here --%>
      </.flex>
    </div>
    """
  end
end
```
