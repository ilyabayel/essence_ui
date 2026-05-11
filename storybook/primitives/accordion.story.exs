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
        description: "Headless accordion primitive (single)",
        template: """
        <Accordion.root id="accordion-primitive" type="single">
          <Accordion.item id="accordion-primitive-1-root" value="item-1">
            <Accordion.header>
              <Accordion.trigger id="accordion-primitive-1-content" trigger_id="accordion-primitive-1-trigger">Trigger 1</Accordion.trigger>
            </Accordion.header>
            <Accordion.content id="accordion-primitive-1-content" trigger_id="accordion-primitive-1-trigger">Content 1</Accordion.content>
          </Accordion.item>
          <Accordion.item id="accordion-primitive-2-root" value="item-2">
            <Accordion.header>
              <Accordion.trigger id="accordion-primitive-2-content" trigger_id="accordion-primitive-2-trigger">Trigger 2</Accordion.trigger>
            </Accordion.header>
            <Accordion.content id="accordion-primitive-2-content" trigger_id="accordion-primitive-2-trigger">Content 2</Accordion.content>
          </Accordion.item>
        </Accordion.root>
        """
      },
      %Variation{
        id: :multiple,
        description: "Accordion multiple mode",
        template: """
        <Accordion.root id="accordion-multiple" type="multiple">
          <Accordion.item id="accordion-multiple-1-root" value="item-1">
            <Accordion.header>
              <Accordion.trigger id="accordion-multiple-1-content" trigger_id="accordion-multiple-1-trigger">Trigger 1</Accordion.trigger>
            </Accordion.header>
            <Accordion.content id="accordion-multiple-1-content" trigger_id="accordion-multiple-1-trigger">Content 1</Accordion.content>
          </Accordion.item>
          <Accordion.item id="accordion-multiple-2-root" value="item-2">
            <Accordion.header>
              <Accordion.trigger id="accordion-multiple-2-content" trigger_id="accordion-multiple-2-trigger">Trigger 2</Accordion.trigger>
            </Accordion.header>
            <Accordion.content id="accordion-multiple-2-content" trigger_id="accordion-multiple-2-trigger">Content 2</Accordion.content>
          </Accordion.item>
        </Accordion.root>
        """
      },
      %Variation{
        id: :collapsible,
        description: "Accordion single collapsible mode",
        template: """
        <Accordion.root id="accordion-collapsible" type="single" collapsible={true}>
          <Accordion.item id="accordion-collapsible-1-root" value="item-1">
            <Accordion.header>
              <Accordion.trigger id="accordion-collapsible-1-content" trigger_id="accordion-collapsible-1-trigger">Trigger 1</Accordion.trigger>
            </Accordion.header>
            <Accordion.content id="accordion-collapsible-1-content" trigger_id="accordion-collapsible-1-trigger">Content 1</Accordion.content>
          </Accordion.item>
        </Accordion.root>
        """
      }
    ]
  end
end
