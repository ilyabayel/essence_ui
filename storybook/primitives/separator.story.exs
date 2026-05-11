defmodule Storybook.Primitives.SeparatorStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Separator

  def function, do: &Separator.separator/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :horizontal,
        description: "Horizontal separator",
        template: """
        <div style="width: 100%; max-width: 300px; margin: 15px 0">
          <h1 class="Text" style="font-weight: 600">
            EssenceUI Primitives
          </h1>
          <p class="Text">An open-source UI component library.</p>
          <Separator.separator class="SeparatorRoot" style="margin: 15px 0" />
          <div style="display: flex; height: 20px; align-items: center;">
            <p class="Text">Blog</p>
            <Separator.separator
              class="SeparatorRoot"
              decorative
              orientation="vertical"
              style="margin: 0 15px"
            />
            <p class="Text">Docs</p>
            <Separator.separator
              class="SeparatorRoot"
              decorative
              orientation="vertical"
              style="margin: 0 15px"
            />
            <p class="Text">Source</p>
          </div>

          <style>
            .SeparatorRoot {
              background-color: gray;
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
              color: black;
              font-size: 15px;
              line-height: 20px;
              margin: 0;
              padding: 0;
            }
          </style>
        </div>
        """
      }
    ]
  end
end
