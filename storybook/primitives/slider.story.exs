defmodule Storybook.Primitives.SliderStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Slider

  def function, do: &Slider.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "slider"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Essence UI slider demo",
        template: """
        <form>
          <Slider.root
            id="slider-primitive"
            class="DemoSliderRoot"
            default_value={[50]}
            max={100}
            step={1}
          >
            <Slider.track class="DemoSliderTrack">
              <Slider.range class="DemoSliderRange" />
            </Slider.track>
            <Slider.thumb
              class="DemoSliderThumb"
              index={0}
              aria-label="Volume"
            />
          </Slider.root>
        </form>
        """
      },
      %Variation{
        id: :range,
        description: "Range slider with two thumbs",
        template: """
        <Slider.root
          id="slider-range"
          class="DemoSliderRoot"
          default_value={[25, 75]}
          max={100}
          step={1}
        >
          <Slider.track class="DemoSliderTrack">
            <Slider.range class="DemoSliderRange" />
          </Slider.track>
          <Slider.thumb
            class="DemoSliderThumb"
            index={0}
            aria-label="Minimum"
          />
          <Slider.thumb
            class="DemoSliderThumb"
            index={1}
            aria-label="Maximum"
          />
        </Slider.root>
        """
      }
    ]
  end
end
