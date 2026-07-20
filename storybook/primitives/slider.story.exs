defmodule Storybook.Primitives.SliderStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Slider

  def function, do: &Slider.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless slider primitive",
        template: """
        <Slider.root id="slider-primitive" default_value={[50]} class="SliderRoot" aria-label="Volume">
          <Slider.track class="SliderTrack">
            <Slider.range class="SliderRange" />
          </Slider.track>
          <Slider.thumb class="SliderThumb" index={0} />
        </Slider.root>

        <style>
          .SliderRoot {
            position: relative; display: flex; align-items: center;
            width: 200px; height: 20px; touch-action: none;
          }
          .SliderTrack {
            background: #ccc; position: relative; flex-grow: 1; height: 3px; border-radius: 9999px;
          }
          .SliderRange {
            position: absolute; background: #585ad4; height: 100%; border-radius: 9999px;
          }
          .SliderThumb {
            display: block; width: 16px; height: 16px; background: white;
            border: 2px solid #585ad4; border-radius: 50%;
            position: absolute; transform: translateX(-50%);
          }
          .SliderThumb:focus { outline: 2px solid black; outline-offset: 2px; }
        </style>
        """
      },
      %Variation{
        id: :range,
        description: "Range slider with two thumbs",
        template: """
        <Slider.root id="slider-range" default_value={[25, 75]} class="SliderRoot" aria-label="Price range">
          <Slider.track class="SliderTrack">
            <Slider.range class="SliderRange" />
          </Slider.track>
          <Slider.thumb class="SliderThumb" index={0} />
          <Slider.thumb class="SliderThumb" index={1} />
        </Slider.root>
        """
      }
    ]
  end
end
