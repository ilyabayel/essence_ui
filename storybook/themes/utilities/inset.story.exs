defmodule Storybook.Themes.Utilities.Inset do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Utilities.Inset

  def layout, do: :one_column

  def function, do: &Inset.inset/1

  def imports,
    do: [{EssenceUI.Components.Card, card: 1}, {EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "padding: 40px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Inset utility for bleeding content",
        template: """
        <.flex gap="4">
          <.card style="width: 240px">
            <.inset side="top" clip="border-box">
              <img
                src="https://images.unsplash.com/photo-1617050318658-a9a3175e34cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80"
                alt="Bold typography"
                style="display: block; object-fit: cover; width: 100%; height: 140px; background-color: var(--gray-5);"
              />
            </.inset>
            <.text as="p" size="2" mt="3">
              <strong style="display: block; margin-bottom: 4px;">Bold typography</strong>
              The goal of the design system is to create a consistent and cohesive user experience.
            </.text>
          </.card>

          <.card style="width: 240px">
            <.inset side="x" py="4" style="background-color: var(--accent-a3)">
              <.flex justify="center" align="center" style="height: 108px">
                 <.text weight="bold" color="indigo">INSET SIDE X</.text>
              </.flex>
            </.inset>
            <.text as="p" size="2" mt="3">
              This card has an inset that bleeds on the left and right sides.
            </.text>
          </.card>
        </.flex>
        """
      }
    ]
  end
end
