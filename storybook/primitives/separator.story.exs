defmodule Storybook.Primitives.SeparatorStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Separator

  def function, do: &Separator.separator/1

  def container, do: :iframe
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Radix docs separator demo",
        template: """
        <div class="radix-demo" data-component="separator">
          <div style="width: 100%; max-width: 300px; margin: 0 15px;">
            <div class="Text" style="font-weight: 500;">Radix Primitives</div>
            <div class="Text">An open-source UI component library.</div>
            <Separator.separator class="SeparatorRoot" style="margin: 15px 0;" />
            <div style="display: flex; height: 20px; align-items: center;">
              <div class="Text">Blog</div>
              <Separator.separator class="SeparatorRoot" decorative orientation="vertical" style="margin: 0 15px;" />
              <div class="Text">Docs</div>
              <Separator.separator class="SeparatorRoot" decorative orientation="vertical" style="margin: 0 15px;" />
              <div class="Text">Source</div>
            </div>
          </div>
          <style>
            .SeparatorRoot {
              background-color: var(--violet-6);
            }
            .SeparatorRoot[data-orientation="horizontal"] {
              height: 1px;
              width: 100%;
            }
            .SeparatorRoot[data-orientation="vertical"] {
              height: 100%;
              width: 1px;
            }

            .Text {
              color: white;
              font-size: 15px;
              line-height: 20px;
            }
          </style>
        </div>
        """
      }
    ]
  end
end
