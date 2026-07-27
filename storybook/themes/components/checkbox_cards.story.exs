defmodule Storybook.Themes.Components.CheckboxCards do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Box
  alias EssenceUI.Components.CheckboxCards
  alias EssenceUI.Components.Flex
  alias EssenceUI.Components.Text

  def function, do: &CheckboxCards.checkbox_cards_root/1

  def imports, do: [{Box, [box: 1]}, {Flex, [flex: 1]}, {Text, [text: 1]}, {CheckboxCards, [checkbox_cards_item: 1]}]

  def layout, do: :one_column

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px; padding: 20px; z-index: 1000;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default checkbox cards with product selection",
        template: """
        <.checkbox_cards_root
          id="checkbox-cards-default"
          default_value={["1"]}
          columns="3"
        >
          <.checkbox_cards_item value="1" checked>
            <.flex
              direction="column"
              width="100%"
            >
              <.text weight="bold">A1 Keyboard</.text>
              <.text>US Layout</.text>
            </.flex>
          </.checkbox_cards_item>
          <.checkbox_cards_item value="2">
            <.flex
              direction="column"
              width="100%"
            >
              <.text weight="bold">Pro Mouse</.text>
              <.text>Zero-lag wireless</.text>
            </.flex>
          </.checkbox_cards_item>
          <.checkbox_cards_item value="3">
            <.flex
              direction="column"
              width="100%"
            >
              <.text weight="bold">Lightning Mat</.text>
              <.text>Wireless charging</.text>
            </.flex>
          </.checkbox_cards_item>
        </.checkbox_cards_root>
        """
      },
      %Variation{
        id: :size,
        description: "Size",
        template: """
        <.flex direction="column" gap="4">
          <.checkbox_cards_root default_value={["1"]} columns="3" size="1">
            <.checkbox_cards_item value="1" size="1" checked>Option 1</.checkbox_cards_item>
            <.checkbox_cards_item value="2" size="1">Option 2</.checkbox_cards_item>
            <.checkbox_cards_item value="3" size="1">Option 3</.checkbox_cards_item>
          </.checkbox_cards_root>
          <.checkbox_cards_root default_value={["1"]} columns="3" size="2">
            <.checkbox_cards_item value="1" checked>Option 1</.checkbox_cards_item>
            <.checkbox_cards_item value="2">Option 2</.checkbox_cards_item>
            <.checkbox_cards_item value="3">Option 3</.checkbox_cards_item>
          </.checkbox_cards_root>
          <.checkbox_cards_root default_value={["1"]} columns="3" size="3">
            <.checkbox_cards_item value="1" size="3" checked>Option 1</.checkbox_cards_item>
            <.checkbox_cards_item value="2" size="3">Option 2</.checkbox_cards_item>
            <.checkbox_cards_item value="3" size="3">Option 3</.checkbox_cards_item>
          </.checkbox_cards_root>
        </.flex>
        """
      },
      %Variation{
        id: :variant,
        description: "Variant",
        template: """
        <.flex direction="column" gap="4">
          <.checkbox_cards_root default_value={["1"]} columns="3" variant="surface">
            <.checkbox_cards_item value="1" checked>Surface</.checkbox_cards_item>
            <.checkbox_cards_item value="2">Surface</.checkbox_cards_item>
            <.checkbox_cards_item value="3">Surface</.checkbox_cards_item>
          </.checkbox_cards_root>
          <.checkbox_cards_root default_value={["1"]} columns="3" variant="classic">
            <.checkbox_cards_item value="1" checked>Classic</.checkbox_cards_item>
            <.checkbox_cards_item value="2">Classic</.checkbox_cards_item>
            <.checkbox_cards_item value="3">Classic</.checkbox_cards_item>
          </.checkbox_cards_root>
        </.flex>
        """
      },
      %Variation{
        id: :color,
        description: "Color",
        template: """
        <.flex direction="column" gap="4">
          <.checkbox_cards_root default_value={["1"]} columns="3" color="indigo">
            <.checkbox_cards_item value="1" checked>Indigo</.checkbox_cards_item>
            <.checkbox_cards_item value="2">Indigo</.checkbox_cards_item>
            <.checkbox_cards_item value="3">Indigo</.checkbox_cards_item>
          </.checkbox_cards_root>
          <.checkbox_cards_root default_value={["1"]} columns="3" color="cyan">
            <.checkbox_cards_item value="1" checked>Cyan</.checkbox_cards_item>
            <.checkbox_cards_item value="2">Cyan</.checkbox_cards_item>
            <.checkbox_cards_item value="3">Cyan</.checkbox_cards_item>
          </.checkbox_cards_root>
          <.checkbox_cards_root default_value={["1"]} columns="3" color="orange">
            <.checkbox_cards_item value="1" checked>Orange</.checkbox_cards_item>
            <.checkbox_cards_item value="2">Orange</.checkbox_cards_item>
            <.checkbox_cards_item value="3">Orange</.checkbox_cards_item>
          </.checkbox_cards_root>
          <.checkbox_cards_root default_value={["1"]} columns="3" color="crimson">
            <.checkbox_cards_item value="1" checked>Crimson</.checkbox_cards_item>
            <.checkbox_cards_item value="2">Crimson</.checkbox_cards_item>
            <.checkbox_cards_item value="3">Crimson</.checkbox_cards_item>
          </.checkbox_cards_root>
        </.flex>
        """
      },
      %Variation{
        id: :disabled,
        description: "Disabled",
        template: """
        <.flex direction="column" gap="4">
          <.checkbox_cards_root default_value={["1"]} columns="3">
            <.checkbox_cards_item value="1" checked disabled>Off</.checkbox_cards_item>
            <.checkbox_cards_item value="2" disabled>Off</.checkbox_cards_item>
            <.checkbox_cards_item value="3" disabled>Off</.checkbox_cards_item>
          </.checkbox_cards_root>
          <.checkbox_cards_root default_value={["1"]} columns="3">
            <.checkbox_cards_item value="1" checked>On</.checkbox_cards_item>
            <.checkbox_cards_item value="2" disabled>Off</.checkbox_cards_item>
            <.checkbox_cards_item value="3">On</.checkbox_cards_item>
          </.checkbox_cards_root>
        </.flex>
        """
      }
    ]
  end
end
