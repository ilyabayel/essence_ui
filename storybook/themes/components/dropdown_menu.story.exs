defmodule Storybook.Themes.Components.DropdownMenu do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Button
  alias EssenceUI.Components.DropdownMenu

  def function, do: &DropdownMenu.dropdown_menu_root/1

  def imports,
    do: [
      {EssenceUI.Components.Flex, flex: 1},
      {EssenceUI.Components.Grid, grid: 1},
      {Button, button: 1},
      {DropdownMenu, dropdown_menu_trigger: 1},
      {DropdownMenu, dropdown_menu_trigger_icon: 1},
      {DropdownMenu, dropdown_menu_content: 1},
      {DropdownMenu, dropdown_menu_item: 1},
      {DropdownMenu, dropdown_menu_separator: 1},
      {DropdownMenu, dropdown_menu_label: 1},
      {DropdownMenu, dropdown_menu_checkbox_item: 1},
      {DropdownMenu, dropdown_menu_radio_item: 1},
      {DropdownMenu, dropdown_menu_sub: 1},
      {DropdownMenu, dropdown_menu_sub_trigger: 1},
      {DropdownMenu, dropdown_menu_sub_content: 1}
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
        description: "Default dropdown menu",
        template: """
        <.dropdown_menu_root>
          <.dropdown_menu_trigger>
            <.button variant="soft">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content>
            <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
            <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>

            <.dropdown_menu_sub>
              <.dropdown_menu_sub_trigger>More</.dropdown_menu_sub_trigger>
              <.dropdown_menu_sub_content>
                <.dropdown_menu_item>Move to project…</.dropdown_menu_item>
                <.dropdown_menu_item>Move to folder…</.dropdown_menu_item>

                <.dropdown_menu_separator />
                <.dropdown_menu_item>Advanced options…</.dropdown_menu_item>
              </.dropdown_menu_sub_content>
            </.dropdown_menu_sub>

            <.dropdown_menu_separator />
            <.dropdown_menu_item>Share</.dropdown_menu_item>
            <.dropdown_menu_item>Add to favorites</.dropdown_menu_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_item shortcut="⌘ ⌫" color="red">
              Delete
            </.dropdown_menu_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        """
      },
      %Variation{
        id: :size,
        description: "Size",
        template: """
        <.flex gap="4" align="center">
          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="soft" size="1">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content size="1">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="soft" size="2">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content size="2">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>
        </.flex>
        """
      },
      %Variation{
        id: :variant,
        description: "Variant",
        template: """
        <.flex gap="4" align="center">
          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="solid">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content variant="solid">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="soft">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content variant="soft">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ ⌫" color="red">Delete</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>
        </.flex>
        """
      },
      %Variation{
        id: :color,
        description: "Color",
        template: """
        <.flex gap="4" wrap="wrap">
          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="soft" color="indigo">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content color="indigo">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="soft" color="cyan">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content color="cyan">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="soft" color="orange">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content color="orange">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="soft" color="crimson">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content color="crimson">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>
        </.flex>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High-contrast",
        template: """
        <.grid columns="2" gap="3" display="inline-grid">
          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button color="gray">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content color="gray">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button color="gray" high_contrast>
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content color="gray" high_contrast>
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button color="gray" variant="soft">
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content color="gray" variant="soft">
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button color="gray" variant="soft" high_contrast>
                Options
                <.dropdown_menu_trigger_icon />
              </.button>
            </.dropdown_menu_trigger>
            <.dropdown_menu_content color="gray" variant="soft" high_contrast>
              <.dropdown_menu_item shortcut="⌘ E">Edit</.dropdown_menu_item>
              <.dropdown_menu_item shortcut="⌘ D">Duplicate</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item shortcut="⌘ N">Archive</.dropdown_menu_item>
            </.dropdown_menu_content>
          </.dropdown_menu_root>
        </.grid>
        """
      },
      %Variation{
        id: :checkboxes_and_radios,
        description: "Checkboxes and Radios",
        template: """
        <.dropdown_menu_root>
          <.dropdown_menu_trigger>
            <.button variant="soft">
              Options
              <.dropdown_menu_trigger_icon />
            </.button>
          </.dropdown_menu_trigger>
          <.dropdown_menu_content>
            <.dropdown_menu_label>Options</.dropdown_menu_label>
            <.dropdown_menu_checkbox_item checked>Show Grid</.dropdown_menu_checkbox_item>
            <.dropdown_menu_checkbox_item>Show Rulers</.dropdown_menu_checkbox_item>
            <.dropdown_menu_checkbox_item checked disabled>Snap to Grid</.dropdown_menu_checkbox_item>
            <.dropdown_menu_separator />
            <.dropdown_menu_label>Sorting</.dropdown_menu_label>
            <.dropdown_menu_radio_item checked>Ascending</.dropdown_menu_radio_item>
            <.dropdown_menu_radio_item>Descending</.dropdown_menu_radio_item>
          </.dropdown_menu_content>
        </.dropdown_menu_root>
        """
      }
    ]
  end
end
