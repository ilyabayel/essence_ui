defmodule Storybook.Primitives.AspectRatioStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.AspectRatio

  def function, do: &AspectRatio.aspect_ratio/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :square,
        description: "1:1 Aspect Ratio",
        template: """
        <div style="width: 200px;">
          <AspectRatio.aspect_ratio ratio={1.0}>
            <div style="width: 100%; height: 100%; background: #eee; display: flex; align-items: center; justify-content: center;">
              1:1
            </div>
          </AspectRatio.aspect_ratio>
        </div>
        """
      },
      %Variation{
        id: :video,
        description: "16:9 Aspect Ratio",
        template: """
        <div style="width: 300px;">
          <AspectRatio.aspect_ratio ratio={16/9}>
            <div style="width: 100%; height: 100%; background: #eee; display: flex; align-items: center; justify-content: center;">
              16:9
            </div>
          </AspectRatio.aspect_ratio>
        </div>
        """
      }
    ]
  end
end
