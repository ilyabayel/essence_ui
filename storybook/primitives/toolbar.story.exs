defmodule Storybook.Primitives.ToolbarStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Toolbar

  def function, do: &Toolbar.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless toolbar primitive",
        template: """
        <Toolbar.root id="toolbar-primitive" class="ToolbarRoot" aria-label="Formatting">
          <Toolbar.button class="ToolbarButton" aria-label="Cut">Cut</Toolbar.button>
          <Toolbar.button class="ToolbarButton" aria-label="Copy">Copy</Toolbar.button>
          <Toolbar.button class="ToolbarButton" aria-label="Paste">Paste</Toolbar.button>
          <Toolbar.separator class="ToolbarSeparator" />
          <Toolbar.toggle_group type="single" value="center" aria-label="Text alignment">
            <Toolbar.toggle_item class="ToolbarToggleItem" value="left" aria-label="Left">L</Toolbar.toggle_item>
            <Toolbar.toggle_item class="ToolbarToggleItem" value="center" aria-label="Center">C</Toolbar.toggle_item>
            <Toolbar.toggle_item class="ToolbarToggleItem" value="right" aria-label="Right">R</Toolbar.toggle_item>
          </Toolbar.toggle_group>
          <Toolbar.separator class="ToolbarSeparator" />
          <Toolbar.link href="#docs" class="ToolbarLink">Docs</Toolbar.link>
        </Toolbar.root>

        <style>
          .ToolbarRoot {
            display: flex; gap: 4px; padding: 8px; background: #f5f5f5;
            border-radius: 6px; align-items: center;
          }
          .ToolbarButton, .ToolbarToggleItem, .ToolbarLink {
            all: unset; padding: 6px 10px; background: white; border-radius: 4px;
            cursor: pointer; font-size: 13px;
          }
          .ToolbarButton:focus, .ToolbarToggleItem:focus, .ToolbarLink:focus {
            outline: 2px solid black;
          }
          .ToolbarToggleItem[data-state="on"] { background: #585ad4; color: white; }
          .ToolbarSeparator { width: 1px; height: 20px; background: #ccc; margin: 0 4px; }
        </style>
        """
      }
    ]
  end
end
