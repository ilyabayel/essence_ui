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
        <div class="radix-demo" data-component="accordion">
          <Accordion.root id="accordion-primitive" type="single" default_value="item-1" collapsible={true} class="AccordionRoot">
            <Accordion.item id="accordion-primitive-1-root" value="item-1" class="AccordionItem">
              <Accordion.header class="AccordionHeader">
                <Accordion.trigger id="accordion-primitive-1-content" trigger_id="accordion-primitive-1-trigger" class="AccordionTrigger">
                  Is it accessible?
                  <svg class="AccordionChevron" width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true"><path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/></svg>
                </Accordion.trigger>
              </Accordion.header>
              <Accordion.content id="accordion-primitive-1-content" trigger_id="accordion-primitive-1-trigger" class="AccordionContent">
                <div class="AccordionContentText">Yes. It adheres to the WAI-ARIA design pattern.</div>
              </Accordion.content>
            </Accordion.item>
            <Accordion.item id="accordion-primitive-2-root" value="item-2" class="AccordionItem">
              <Accordion.header class="AccordionHeader">
                <Accordion.trigger id="accordion-primitive-2-content" trigger_id="accordion-primitive-2-trigger" class="AccordionTrigger">
                  Is it unstyled?
                  <svg class="AccordionChevron" width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true"><path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/></svg>
                </Accordion.trigger>
              </Accordion.header>
              <Accordion.content id="accordion-primitive-2-content" trigger_id="accordion-primitive-2-trigger" class="AccordionContent">
                <div class="AccordionContentText">Yes. It's unstyled by default, giving you freedom over the look and feel.</div>
              </Accordion.content>
            </Accordion.item>
            <Accordion.item id="accordion-primitive-3-root" value="item-3" class="AccordionItem">
              <Accordion.header class="AccordionHeader">
                <Accordion.trigger id="accordion-primitive-3-content" trigger_id="accordion-primitive-3-trigger" class="AccordionTrigger">
                  Can it be animated?
                  <svg class="AccordionChevron" width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true"><path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/></svg>
                </Accordion.trigger>
              </Accordion.header>
              <Accordion.content id="accordion-primitive-3-content" trigger_id="accordion-primitive-3-trigger" class="AccordionContent">
                <div class="AccordionContentText">Yes! You can animate the Accordion with CSS or JavaScript.</div>
              </Accordion.content>
            </Accordion.item>
          </Accordion.root>
        </div>
        """
      },
      %Variation{
        id: :multiple,
        description: "Accordion multiple mode",
        template: """
        <div class="radix-demo" data-component="accordion">
          <Accordion.root id="accordion-multiple" type="multiple" class="AccordionRoot">
            <Accordion.item id="accordion-multiple-1-root" value="item-1" class="AccordionItem">
              <Accordion.header class="AccordionHeader">
                <Accordion.trigger id="accordion-multiple-1-content" trigger_id="accordion-multiple-1-trigger" class="AccordionTrigger">
                  Is it accessible?
                  <svg class="AccordionChevron" width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true"><path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/></svg>
                </Accordion.trigger>
              </Accordion.header>
              <Accordion.content id="accordion-multiple-1-content" trigger_id="accordion-multiple-1-trigger" class="AccordionContent">
                <div class="AccordionContentText">Yes. It adheres to the WAI-ARIA design pattern.</div>
              </Accordion.content>
            </Accordion.item>
            <Accordion.item id="accordion-multiple-2-root" value="item-2" class="AccordionItem">
              <Accordion.header class="AccordionHeader">
                <Accordion.trigger id="accordion-multiple-2-content" trigger_id="accordion-multiple-2-trigger" class="AccordionTrigger">
                  Is it unstyled?
                  <svg class="AccordionChevron" width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true"><path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/></svg>
                </Accordion.trigger>
              </Accordion.header>
              <Accordion.content id="accordion-multiple-2-content" trigger_id="accordion-multiple-2-trigger" class="AccordionContent">
                <div class="AccordionContentText">Yes. It's unstyled by default, giving you freedom over the look and feel.</div>
              </Accordion.content>
            </Accordion.item>
          </Accordion.root>
        </div>
        """
      },
      %Variation{
        id: :collapsible,
        description: "Accordion single collapsible mode",
        template: """
        <div class="radix-demo" data-component="accordion">
          <Accordion.root id="accordion-collapsible" type="single" collapsible={true} class="AccordionRoot">
            <Accordion.item id="accordion-collapsible-1-root" value="item-1" class="AccordionItem">
              <Accordion.header class="AccordionHeader">
                <Accordion.trigger id="accordion-collapsible-1-content" trigger_id="accordion-collapsible-1-trigger" class="AccordionTrigger">
                  Can it be animated?
                  <svg class="AccordionChevron" width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true"><path d="M3.135 6.158a.5.5 0 0 1 .707-.023L7.5 9.565l3.658-3.43a.5.5 0 0 1 .684.73l-4 3.75a.5.5 0 0 1-.684 0l-4-3.75a.5.5 0 0 1-.023-.707Z" fill="currentColor"/></svg>
                </Accordion.trigger>
              </Accordion.header>
              <Accordion.content id="accordion-collapsible-1-content" trigger_id="accordion-collapsible-1-trigger" class="AccordionContent">
                <div class="AccordionContentText">Yes! You can animate the Accordion with CSS or JavaScript.</div>
              </Accordion.content>
            </Accordion.item>
          </Accordion.root>
        </div>
        """
      }
    ]
  end
end
