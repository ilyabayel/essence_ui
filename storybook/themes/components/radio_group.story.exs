defmodule Storybook.Themes.Components.RadioGroup do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.RadioGroup

  def function, do: &RadioGroup.radio_group_root/1

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}, {RadioGroup, radio_group_item: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px; padding: 24px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default radio group",
        template: """
        <.radio_group_root id="radio-default" default_value="apple" name="fruit">
          <.flex direction="column" gap="2">
            <.radio_group_item value="apple" checked>Apple</.radio_group_item>
            <.radio_group_item value="orange">Orange</.radio_group_item>
            <.radio_group_item value="banana">Banana</.radio_group_item>
          </.flex>
        </.radio_group_root>
        """
      },
      %Variation{
        id: :size,
        description: "Different sizes",
        template: """
        <.flex direction="column" gap="4">
          <.radio_group_root id="radio-size-1" size="1" default_value="1">
            <.flex gap="2">
              <.radio_group_item value="1" size="1" />
              <.radio_group_item value="2" size="1" />
            </.flex>
          </.radio_group_root>

          <.radio_group_root id="radio-size-2" size="2" default_value="1">
            <.flex gap="2">
              <.radio_group_item value="1" size="2" />
              <.radio_group_item value="2" size="2" />
            </.flex>
          </.radio_group_root>

          <.radio_group_root id="radio-size-3" size="3" default_value="1">
            <.flex gap="2">
              <.radio_group_item value="1" size="3" />
              <.radio_group_item value="2" size="3" />
            </.flex>
          </.radio_group_root>
        </.flex>
        """
      },
      %Variation{
        id: :variant,
        description: "Variant",
        template: """
        <.flex direction="column" gap="4">
          <.radio_group_root id="radio-variant-surface" variant="surface" default_value="1" name="v1">
            <.flex gap="2">
              <.radio_group_item value="1" checked>Surface</.radio_group_item>
              <.radio_group_item value="2">Surface</.radio_group_item>
            </.flex>
          </.radio_group_root>

          <.radio_group_root id="radio-variant-classic" variant="classic" default_value="1" name="v2">
            <.flex gap="2">
              <.radio_group_item value="1" checked>Classic</.radio_group_item>
              <.radio_group_item value="2">Classic</.radio_group_item>
            </.flex>
          </.radio_group_root>

          <.radio_group_root id="radio-variant-soft" variant="soft" default_value="1" name="v3">
            <.flex gap="2">
              <.radio_group_item value="1" checked>Soft</.radio_group_item>
              <.radio_group_item value="2">Soft</.radio_group_item>
            </.flex>
          </.radio_group_root>
        </.flex>
        """
      },
      %Variation{
        id: :color,
        description: "Color",
        template: """
        <.flex direction="column" gap="4">
        <.radio_group_root id="radio-color-indigo" color="indigo" default_value="1" name="c1">
          <.flex gap="2">
            <.radio_group_item value="1" checked>Indigo</.radio_group_item>
            <.radio_group_item value="2">Indigo</.radio_group_item>
          </.flex>
        </.radio_group_root>

        <.radio_group_root id="radio-color-crimson" color="crimson" default_value="1" name="c2">
          <.flex gap="2">
            <.radio_group_item value="1" checked>Indigo</.radio_group_item>
            <.radio_group_item value="2">Indigo</.radio_group_item>
          </.flex>
        </.radio_group_root>
        </.flex>
        """
      },
      %Variation{
        id: :horizontal,
        description: "Horizontal orientation",
        template: """
        <.radio_group_root id="radio-horizontal" orientation="horizontal" default_value="1" name="h1">
        <.flex gap="4">
          <.radio_group_item value="1" checked>Horizontal 1</.radio_group_item>
          <.radio_group_item value="2">Horizontal 2</.radio_group_item>
          <.radio_group_item value="3">Horizontal 3</.radio_group_item>
        </.flex>
        </.radio_group_root>
        """
      },
      %Variation{
        id: :disabled,
        description: "Disabled states",
        template: """
        <.flex direction="column" gap="4">
        <.radio_group_root id="radio-disabled-root" disabled default_value="1" name="d1">
          <.flex direction="column" gap="2">
            <.radio_group_item value="1" checked>Disabled Root 1</.radio_group_item>
            <.radio_group_item value="2">Disabled Root 2</.radio_group_item>
          </.flex>
        </.radio_group_root>

        <.radio_group_root id="radio-disabled-item" default_value="1" name="d2">
          <.flex direction="column" gap="2">
            <.radio_group_item value="1" checked>Enabled Item</.radio_group_item>
            <.radio_group_item value="2" disabled>Disabled Item</.radio_group_item>
            <.radio_group_item value="3">Enabled Item</.radio_group_item>
          </.flex>
        </.radio_group_root>
        </.flex>
        """
      }
    ]
  end
end
