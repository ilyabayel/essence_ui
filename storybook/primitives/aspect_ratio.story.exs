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
        id: :primitive,
        description: "Radix docs aspect ratio demo",
        template: """
        <div class="radix-demo" data-component="aspect-ratio">
          <div class="Container">
            <AspectRatio.aspect_ratio ratio={16 / 9}>
              <img
                class="Image"
                src="https://images.unsplash.com/photo-1535025183041-0991a977e25b?w=300&dpr=2&q=80"
                alt="Landscape photograph by Tobias Tullius"
              />
            </AspectRatio.aspect_ratio>
          </div>
        </div>
        """
      },
      %Variation{
        id: :square,
        description: "1:1 Aspect Ratio",
        template: """
        <div class="radix-demo" data-component="aspect-ratio">
          <div style="width: 200px;">
            <AspectRatio.aspect_ratio ratio={1.0}>
              <div style="width: 100%; height: 100%; background: #eee; display: flex; align-items: center; justify-content: center; color: #333;">
                1:1
              </div>
            </AspectRatio.aspect_ratio>
          </div>
        </div>
        """
      }
    ]
  end
end
