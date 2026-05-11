defmodule Storybook.Primitives.AccordionStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Accordion

  def function, do: &Accordion.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless accordion primitive",
        template: """
        <Accordion.root id="accordion-primitive" type="single">
          <Accordion.item value="item-1">
            <Accordion.header>
              <Accordion.trigger>Trigger 1</Accordion.trigger>
            </Accordion.header>
            <Accordion.content>Content 1</Accordion.content>
          </Accordion.item>
          <Accordion.item value="item-2">
            <Accordion.header>
              <Accordion.trigger>Trigger 2</Accordion.trigger>
            </Accordion.header>
            <Accordion.content>Content 2</Accordion.content>
          </Accordion.item>
        </Accordion.root>
        """
      }
    ]
  end
end
