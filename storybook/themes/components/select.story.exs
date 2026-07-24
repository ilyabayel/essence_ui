defmodule Storybook.Themes.Components.Select do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Select

  def function, do: &Select.select_root/1

  def imports,
    do: [
      {EssenceUI.Components.Flex, flex: 1},
      {EssenceUI.Components.Grid, grid: 1},
      {Select, select_trigger: 1},
      {Select, select_content: 1},
      {Select, select_item: 1},
      {Select, select_group: 1},
      {Select, select_label: 1},
      {Select, select_separator: 1}
    ]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px; min-height: 400px; padding: 24px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default select",
        template: """
        <.select_root id="select-default" value="apple">
          <.select_trigger placeholder="Select a fruit..." />
          <.select_content>
            <.select_group>
              <.select_label>Fruits</.select_label>
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
              <.select_item value="banana">Banana</.select_item>
            </.select_group>
            <.select_separator />
            <.select_group>
              <.select_label>Vegetables</.select_label>
              <.select_item value="carrot">Carrot</.select_item>
              <.select_item value="potato">Potato</.select_item>
            </.select_group>
          </.select_content>
        </.select_root>
        """
      },
      %Variation{
        id: :size,
        description: "Size",
        template: """
        <.flex gap="4" align="center">
          <.select_root id="select-size-1" value="apple">
            <.select_trigger size="1" />
            <.select_content size="1">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>

          <.select_root id="select-size-2" value="apple">
            <.select_trigger size="2" />
            <.select_content size="2">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>

          <.select_root id="select-size-3" value="apple">
            <.select_trigger size="3" />
            <.select_content size="3">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>
        </.flex>
        """
      },
      %Variation{
        id: :variant,
        description: "Variant",
        template: """
        <.flex gap="4" align="center">
          <.select_root id="select-variant-surface" value="apple">
            <.select_trigger variant="surface" />
            <.select_content variant="solid">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>

          <.select_root id="select-variant-soft" value="apple">
            <.select_trigger variant="soft" />
            <.select_content variant="soft">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>

          <.select_root id="select-variant-outline" value="apple">
            <.select_trigger variant="classic" />
            <.select_content variant="solid">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>
        </.flex>
        """
      },
      %Variation{
        id: :color,
        description: "Color",
        template: """
        <.flex gap="4" wrap="wrap">
          <.select_root id="select-color-indigo" value="apple">
            <.select_trigger color="indigo" />
            <.select_content color="indigo">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>

          <.select_root id="select-color-cyan" value="apple">
            <.select_trigger color="cyan" />
            <.select_content color="cyan">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>

          <.select_root id="select-color-orange" value="apple">
            <.select_trigger color="orange" />
            <.select_content color="orange">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>

          <.select_root id="select-color-crimson" value="apple">
            <.select_trigger color="crimson" />
            <.select_content color="crimson">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
            </.select_content>
          </.select_root>
        </.flex>
        """
      },
      %Variation{
        id: :position,
        description: "Position",
        template: """
        <.flex gap="4">
          <.select_root id="select-position-item-aligned" value="apple">
            <.select_trigger placeholder="Item aligned (default)" />
            <.select_content position="item-aligned">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
              <.select_item value="banana">Banana</.select_item>
            </.select_content>
          </.select_root>

          <.select_root id="select-position-popper" value="apple">
            <.select_trigger placeholder="Popper" />
            <.select_content position="popper">
              <.select_item value="apple">Apple</.select_item>
              <.select_item value="orange">Orange</.select_item>
              <.select_item value="banana">Banana</.select_item>
            </.select_content>
          </.select_root>
        </.flex>
        """
      }
    ]
  end
end
