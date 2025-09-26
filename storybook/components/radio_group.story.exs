defmodule Storybook.Components.RadioGroup do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.RadioGroup

  def function, do: &RadioGroup.radio_group/1

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default radio group",
        template: """
        <.radio_group default_value="option2" name="example">
          <:item value="option1">Option 1</:item>
          <:item value="option2">Option 2</:item>
          <:item value="option3">Option 3</:item>
        </.radio_group>
        """
      },
      %Variation{
        id: :size,
        description: "Size",
        template: """
        <.flex align="center">
          <.radio_group default_value="size1" name="size1" size="1">
            <:item value="size1"></:item>
          </.radio_group>
          <.radio_group default_value="size2" name="size2" size="2">
            <:item value="size2"></:item>
          </.radio_group>
          <.radio_group default_value="size3" name="size3" size="3">
            <:item value="size3"></:item>
          </.radio_group>
        </.flex>
        """
      }
    ]
  end
end
