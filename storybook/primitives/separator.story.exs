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
        <div>Section 1</div>
        <Separator.separator orientation="horizontal" style="margin: 10px 0; border-top: 1px solid gray;" />
        <div>Section 2</div>
        """
      },
      %Variation{
        id: :vertical,
        description: "Vertical separator",
        template: """
        <div style="display: flex; height: 20px; align-items: center;">
          <div>Item 1</div>
          <Separator.separator orientation="vertical" style="margin: 0 10px; border-left: 1px solid gray; height: 100%;" />
          <div>Item 2</div>
        </div>
        """
      }
    ]
  end
end
