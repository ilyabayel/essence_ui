defmodule Storybook.Components.RadioCards do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.RadioCards

  def function, do: &RadioCards.radio_cards_root/1

  def imports,
    do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}, {RadioCards, radio_cards_item: 1}]

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
        description: "Default radio cards",
        template: """
        <.radio_cards_root default_value="1" columns="3">
          <.radio_cards_item value="1">
            <.flex direction="column" width="100%">
              <.text weight="bold">A1 Keyboard</.text>
              <.text>US Layout</.text>
            </.flex>
          </.radio_cards_item>
          <.radio_cards_item value="2">
            <.flex direction="column" width="100%">
              <.text weight="bold">Pro Mouse</.text>
              <.text>Zero-lag wireless</.text>
            </.flex>
          </.radio_cards_item>
          <.radio_cards_item value="3">
            <.flex direction="column" width="100%">
              <.text weight="bold">Lighting Kit</.text>
              <.text>RGB LED</.text>
            </.flex>
          </.radio_cards_item>
        </.radio_cards_root>
        """
      },
      %Variation{
        id: :size,
        description: "Size",
        template: """
        <.flex direction="column" gap="4">
          <.radio_cards_root default_value="1" columns="3" size="1">
            <.radio_cards_item value="1">Option 1</.radio_cards_item>
            <.radio_cards_item value="2">Option 2</.radio_cards_item>
            <.radio_cards_item value="3">Option 3</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3" size="2">
            <.radio_cards_item value="1">Option 1</.radio_cards_item>
            <.radio_cards_item value="2">Option 2</.radio_cards_item>
            <.radio_cards_item value="3">Option 3</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3" size="3">
            <.radio_cards_item value="1">Option 1</.radio_cards_item>
            <.radio_cards_item value="2">Option 2</.radio_cards_item>
            <.radio_cards_item value="3">Option 3</.radio_cards_item>
          </.radio_cards_root>
        </.flex>
        """
      },
      %Variation{
        id: :variant,
        description: "Variant",
        template: """
        <.flex direction="column" gap="4">
          <.radio_cards_root default_value="1" columns="3" variant="surface">
            <.radio_cards_item value="1">Surface</.radio_cards_item>
            <.radio_cards_item value="2">Surface</.radio_cards_item>
            <.radio_cards_item value="3">Surface</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3" variant="classic">
            <.radio_cards_item value="1">Classic</.radio_cards_item>
            <.radio_cards_item value="2">Classic</.radio_cards_item>
            <.radio_cards_item value="3">Classic</.radio_cards_item>
          </.radio_cards_root>
        </.flex>
        """
      },
      %Variation{
        id: :color,
        description: "Color",
        template: """
        <.flex direction="column" gap="4">
          <.radio_cards_root default_value="1" columns="3" color="indigo">
            <.radio_cards_item value="1">Indigo</.radio_cards_item>
            <.radio_cards_item value="2">Indigo</.radio_cards_item>
            <.radio_cards_item value="3">Indigo</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3" color="cyan">
            <.radio_cards_item value="1">Cyan</.radio_cards_item>
            <.radio_cards_item value="2">Cyan</.radio_cards_item>
            <.radio_cards_item value="3">Cyan</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3" color="orange">
            <.radio_cards_item value="1">Orange</.radio_cards_item>
            <.radio_cards_item value="2">Orange</.radio_cards_item>
            <.radio_cards_item value="3">Orange</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3" color="crimson">
            <.radio_cards_item value="1">Crimson</.radio_cards_item>
            <.radio_cards_item value="2">Crimson</.radio_cards_item>
            <.radio_cards_item value="3">Crimson</.radio_cards_item>
          </.radio_cards_root>
        </.flex>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High Contrast",
        template: """
        <.flex direction="column" gap="4">
          <.radio_cards_root default_value="1" columns="3" color="indigo" high_contrast>
            <.radio_cards_item value="1">Indigo</.radio_cards_item>
            <.radio_cards_item value="2">Indigo</.radio_cards_item>
            <.radio_cards_item value="3">Indigo</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3" color="cyan" high_contrast>
            <.radio_cards_item value="1">Cyan</.radio_cards_item>
            <.radio_cards_item value="2">Cyan</.radio_cards_item>
            <.radio_cards_item value="3">Cyan</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3" color="orange" high_contrast>
            <.radio_cards_item value="1">Orange</.radio_cards_item>
            <.radio_cards_item value="2">Orange</.radio_cards_item>
            <.radio_cards_item value="3">Orange</.radio_cards_item>
          </.radio_cards_root>
        </.flex>
        """
      },
      %Variation{
        id: :disabled,
        description: "Disabled",
        template: """
        <.flex direction="column" gap="4">
          <.radio_cards_root default_value="1" columns="3">
            <.radio_cards_item value="1" disabled>Off</.radio_cards_item>
            <.radio_cards_item value="2" disabled>Off</.radio_cards_item>
            <.radio_cards_item value="3" disabled>Off</.radio_cards_item>
          </.radio_cards_root>
          <.radio_cards_root default_value="1" columns="3">
            <.radio_cards_item value="1">On</.radio_cards_item>
            <.radio_cards_item value="2" disabled>Off</.radio_cards_item>
            <.radio_cards_item value="3">On</.radio_cards_item>
          </.radio_cards_root>
        </.flex>
        """
      }
    ]
  end
end
