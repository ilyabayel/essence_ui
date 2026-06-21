defmodule Storybook.Primitives.CollapsibleStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Collapsible

  def function, do: &Collapsible.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless collapsible primitive",
        template: """
        <Collapsible.root id="collapsible-primitive">
          <Collapsible.trigger id="collapsible-trigger" content_id="collapsible-content">Toggle</Collapsible.trigger>
          <Collapsible.content id="collapsible-content">
            Content that can be collapsed
          </Collapsible.content>
        </Collapsible.root>
        """
      }
    ]
  end
end
