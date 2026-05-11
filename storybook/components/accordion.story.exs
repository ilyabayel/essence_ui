defmodule Storybook.Components.AccordionStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Accordion

  def function, do: &Accordion.accordion/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def imports, do: [{Accordion, [accordion_header: 1, accordion_trigger: 1, accordion_content: 1]}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default single accordion",
        template: """
        <.accordion default_value="item-1">
          <:item value="item-1" :let={ctx}>
            <.accordion_header>
              <.accordion_trigger state={ctx.state}>Is it accessible?</.accordion_trigger>
            </.accordion_header>
            <.accordion_content state={ctx.state}>
              Yes. It adheres to the WAI-ARIA design pattern.
            </.accordion_content>
          </:item>
          <:item value="item-2" :let={ctx}>
            <.accordion_header>
              <.accordion_trigger state={ctx.state}>Is it unstyled?</.accordion_trigger>
            </.accordion_header>
            <.accordion_content state={ctx.state}>
              Yes. It's unstyled by default, giving you freedom over the look and feel.
            </.accordion_content>
          </:item>
          <:item value="item-3" :let={ctx}>
            <.accordion_header>
              <.accordion_trigger state={ctx.state}>Can it be animated?</.accordion_trigger>
            </.accordion_header>
            <.accordion_content state={ctx.state}>
              Yes! You can use the CSS transitions or animations to animate it.
            </.accordion_content>
          </:item>
        </.accordion>
        """
      },
      %Variation{
        id: :multiple,
        description: "Multiple accordion",
        template: """
        <.accordion type="multiple">
          <:item value="item-1" :let={ctx}>
            <.accordion_header>
              <.accordion_trigger state={ctx.state}>Item 1</.accordion_trigger>
            </.accordion_header>
            <.accordion_content state={ctx.state}>
              Content for item 1
            </.accordion_content>
          </:item>
          <:item value="item-2" :let={ctx}>
            <.accordion_header>
              <.accordion_trigger state={ctx.state}>Item 2</.accordion_trigger>
            </.accordion_header>
            <.accordion_content state={ctx.state}>
              Content for item 2
            </.accordion_content>
          </:item>
        </.accordion>
        """
      },
      %Variation{
        id: :collapsible,
        description: "Single collapsible accordion",
        template: """
        <.accordion type="single" collapsible={true}>
          <:item value="item-1" :let={ctx}>
            <.accordion_header>
              <.accordion_trigger state={ctx.state}>Item 1</.accordion_trigger>
            </.accordion_header>
            <.accordion_content state={ctx.state}>
              Content for item 1
            </.accordion_content>
          </:item>
        </.accordion>
        """
      }
    ]
  end
end
