defmodule Storybook.Components.ContextMenu do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.ContextMenu

  def function, do: &ContextMenu.context_menu_root/1

  def imports,
    do: [
      {EssenceUI.Components.Flex, flex: 1},
      {EssenceUI.Components.Text, text: 1},
      {ContextMenu, context_menu_trigger: 1},
      {ContextMenu, context_menu_content: 1},
      {ContextMenu, context_menu_item: 1},
      {ContextMenu, context_menu_separator: 1},
      {ContextMenu, context_menu_label: 1},
      {ContextMenu, context_menu_checkbox_item: 1},
      {ContextMenu, context_menu_sub: 1},
      {ContextMenu, context_menu_sub_trigger: 1},
      {ContextMenu, context_menu_sub_content: 1}
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
        description: "Default context menu",
        template: """
        <.context_menu_root>
          <.context_menu_trigger>
            <div style="height: 150px; width: 300px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Right-click here</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content>
            <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
            <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            <.context_menu_sub>
              <.context_menu_sub_trigger>More</.context_menu_sub_trigger>
              <.context_menu_sub_content>
                <.context_menu_item>Move to project…</.context_menu_item>
                <.context_menu_item>Move to folder…</.context_menu_item>
                <.context_menu_separator />
                <.context_menu_item>Advanced options…</.context_menu_item>
              </.context_menu_sub_content>
            </.context_menu_sub>
            <.context_menu_separator />
            <.context_menu_item>Share</.context_menu_item>
            <.context_menu_item>Add to favorites</.context_menu_item>
            <.context_menu_separator />
            <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
          </.context_menu_content>
        </.context_menu_root>
        """
      },
      %Variation{
        id: :with_checkboxes,
        description: "With checkboxes",
        template: """
        <.context_menu_root>
          <.context_menu_trigger>
            <div style="height: 150px; width: 300px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
              <.text>Right-click here</.text>
            </div>
          </.context_menu_trigger>
          <.context_menu_content>
            <.context_menu_label>Options</.context_menu_label>
            <.context_menu_checkbox_item checked>Show Grid</.context_menu_checkbox_item>
            <.context_menu_checkbox_item>Show Rulers</.context_menu_checkbox_item>
            <.context_menu_checkbox_item checked disabled>Snap to Grid</.context_menu_checkbox_item>
          </.context_menu_content>
        </.context_menu_root>
        """
      },
      %Variation{
        id: :size,
        description: "Size",
        template: """
        <.flex gap="4" wrap="wrap">
          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Size 1</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content size="1">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>

          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Size 2</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content size="2">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>
        </.flex>
        """
      },
      %Variation{
        id: :variant,
        description: "Variant",
        template: """
        <.flex gap="4" wrap="wrap">
          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Solid</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content variant="solid">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>

          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Soft</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content variant="soft">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>
        </.flex>
        """
      },
      %Variation{
        id: :color,
        description: "Color",
        template: """
        <.flex gap="4" wrap="wrap">
          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Indigo</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content color="indigo">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>

          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Cyan</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content color="cyan">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>

          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Orange</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content color="orange">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>

          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Crimson</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content color="crimson">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ ⌫" color="red">Delete</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>
        </.flex>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High-contrast",
        template: """
        <.flex gap="4" wrap="wrap">
          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>Standard</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content color="gray">
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>

          <.context_menu_root>
            <.context_menu_trigger>
              <div style="height: 150px; width: 200px; border: 1px dashed var(--gray-a7); border-radius: var(--radius-3); display: flex; align-items: center; justify-content: center; background: var(--gray-a2); user-select: none;">
                <.text>High-contrast</.text>
              </div>
            </.context_menu_trigger>
            <.context_menu_content color="gray" high_contrast>
              <.context_menu_item shortcut="⌘ E">Edit</.context_menu_item>
              <.context_menu_item shortcut="⌘ D">Duplicate</.context_menu_item>
              <.context_menu_separator />
              <.context_menu_item shortcut="⌘ N">Archive</.context_menu_item>
            </.context_menu_content>
          </.context_menu_root>
        </.flex>
        """
      }
    ]
  end
end
