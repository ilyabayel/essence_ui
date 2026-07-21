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
        description: "Radix docs toolbar demo",
        template: """
        <div class="radix-demo" data-component="toolbar">
          <Toolbar.root id="toolbar-primitive" class="ToolbarRoot" aria-label="Formatting options">
            <Toolbar.toggle_group type="multiple" aria-label="Text formatting">
              <Toolbar.toggle_item class="ToolbarToggleItem" value="bold" aria-label="Bold">
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M5.10505 2C4.77043 2 4.5 2.27043 4.5 2.60505V12.3949C4.5 12.7296 4.77043 13 5.10505 13H8.95C10.8125 13 12.25 11.5625 12.25 9.7C12.25 8.4 11.55 7.25 10.5 6.7C11.15 6.2 11.55 5.45 11.55 4.55C11.55 2.95 10.25 2 8.55 2H5.10505ZM5.75 6.85V3.25H8.4C9.35 3.25 10.05 3.85 10.05 4.8C10.05 5.75 9.35 6.35 8.4 6.35L5.75 6.85ZM5.75 8.1H8.65C9.75 8.1 10.55 8.8 10.55 9.9C10.55 11 9.75 11.7 8.65 11.7H5.75V8.1Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </Toolbar.toggle_item>
              <Toolbar.toggle_item class="ToolbarToggleItem" value="italic" aria-label="Italic">
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M5.67494 3.50001C5.67494 3.27615 5.85646 3.09463 6.08032 3.09463H10.4197C10.6435 3.09463 10.8251 3.27615 10.8251 3.50001C10.8251 3.72387 10.6435 3.90539 10.4197 3.90539H8.56935L6.23062 11.0946H7.9197C8.14355 11.0946 8.32508 11.2762 8.32508 11.5C8.32508 11.7239 8.14355 11.9054 7.9197 11.9054H3.58032C3.35646 11.9054 3.17494 11.7239 3.17494 11.5C3.17494 11.2762 3.35646 11.0946 3.58032 11.0946H5.43066L7.76939 3.90539H6.08032C5.85646 3.90539 5.67494 3.72387 5.67494 3.50001Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </Toolbar.toggle_item>
              <Toolbar.toggle_item class="ToolbarToggleItem" value="strikethrough" aria-label="Strike through">
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M5.00001 2.75C5.00001 2.47386 5.22387 2.25 5.50001 2.25H9.50001C9.77615 2.25 10 2.47386 10 2.75C10 3.02614 9.77615 3.25 9.50001 3.25H5.50001C5.22387 3.25 5.00001 3.02614 5.00001 2.75ZM2.75 7.5C2.75 7.22386 2.97386 7 3.25 7H11.75C12.0261 7 12.25 7.22386 12.25 7.5C12.25 7.77614 12.0261 8 11.75 8H3.25C2.97386 8 2.75 7.77614 2.75 7.5ZM5.00001 12.25C5.00001 11.9739 5.22387 11.75 5.50001 11.75H9.50001C9.77615 11.75 10 11.9739 10 12.25C10 12.5261 9.77615 12.75 9.50001 12.75H5.50001C5.22387 12.75 5.00001 12.5261 5.00001 12.25Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </Toolbar.toggle_item>
            </Toolbar.toggle_group>
            <Toolbar.separator class="ToolbarSeparator" />
            <Toolbar.toggle_group type="single" value="center" aria-label="Text alignment">
              <Toolbar.toggle_item class="ToolbarToggleItem" value="left" aria-label="Left aligned">
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M2 4.5C2 4.22386 2.22386 4 2.5 4H12.5C12.7761 4 13 4.22386 13 4.5C13 4.77614 12.7761 5 12.5 5H2.5C2.22386 5 2 4.77614 2 4.5ZM2 7.5C2 7.22386 2.22386 7 2.5 7H7.5C7.77614 7 8 7.22386 8 7.5C8 7.77614 7.77614 8 7.5 8H2.5C2.22386 8 2 7.77614 2 7.5ZM2 10.5C2 10.2239 2.22386 10 2.5 10H10.5C10.7761 10 11 10.2239 11 10.5C11 10.7761 10.7761 11 10.5 11H2.5C2.22386 11 2 10.7761 2 10.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </Toolbar.toggle_item>
              <Toolbar.toggle_item class="ToolbarToggleItem" value="center" aria-label="Center aligned">
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M2 4.5C2 4.22386 2.22386 4 2.5 4H12.5C12.7761 4 13 4.22386 13 4.5C13 4.77614 12.7761 5 12.5 5H2.5C2.22386 5 2 4.77614 2 4.5ZM4 7.5C4 7.22386 4.22386 7 4.5 7H10.5C10.7761 7 11 7.22386 11 7.5C11 7.77614 10.7761 8 10.5 8H4.5C4.22386 8 4 7.77614 4 7.5ZM3 10.5C3 10.2239 3.22386 10 3.5 10H11.5C11.7761 10 12 10.2239 12 10.5C12 10.7761 11.7761 11 11.5 11H3.5C3.22386 11 3 10.7761 3 10.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </Toolbar.toggle_item>
              <Toolbar.toggle_item class="ToolbarToggleItem" value="right" aria-label="Right aligned">
                <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M2 4.5C2 4.22386 2.22386 4 2.5 4H12.5C12.7761 4 13 4.22386 13 4.5C13 4.77614 12.7761 5 12.5 5H2.5C2.22386 5 2 4.77614 2 4.5ZM7 7.5C7 7.22386 7.22386 7 7.5 7H12.5C12.7761 7 13 7.22386 13 7.5C13 7.77614 12.7761 8 12.5 8H7.5C7.22386 8 7 7.77614 7 7.5ZM4 10.5C4 10.2239 4.22386 10 4.5 10H12.5C12.7761 10 13 10.2239 13 10.5C13 10.7761 12.7761 11 12.5 11H4.5C4.22386 11 4 10.7761 4 10.5Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path></svg>
              </Toolbar.toggle_item>
            </Toolbar.toggle_group>
            <Toolbar.separator class="ToolbarSeparator" />
            <Toolbar.link class="ToolbarLink" href="#" target="_blank" style="margin-right: 10px;">
              Edited 2 hours ago
            </Toolbar.link>
            <Toolbar.button class="ToolbarButton" style="margin-left: auto;">Share</Toolbar.button>
          </Toolbar.root>
        </div>
        """
      }
    ]
  end
end
