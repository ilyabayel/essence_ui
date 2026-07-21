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
        description: "Radix docs slider demo",
        template: """
        <div class="radix-demo" data-component="slider">
          <form>
            <Slider.root id="slider-primitive" class="SliderRoot" default_value={[50]} max={100} step={1}>
              <Slider.track class="SliderTrack">
                <Slider.range class="SliderRange" />
              </Slider.track>
              <Slider.thumb class="SliderThumb" index={0} aria-label="Volume" />
            </Slider.root>
          </form>
        </div>
        """
      },
      %Variation{
        id: :range,
        description: "Range slider with two thumbs",
        template: """
        <div class="radix-demo" data-component="slider">
          <Slider.root id="slider-range" class="SliderRoot" default_value={[25, 75]} max={100} step={1}>
            <Slider.track class="SliderTrack">
              <Slider.range class="SliderRange" />
            </Slider.track>
            <Slider.thumb class="SliderThumb" index={0} aria-label="Minimum" />
            <Slider.thumb class="SliderThumb" index={1} aria-label="Maximum" />
          </Slider.root>
        </div>
        """
      }
    ]
  end
end
