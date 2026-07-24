defmodule Storybook.Themes.Components.SliderStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Slider

  def function, do: &Slider.slider/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block; padding: 2rem;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def imports,
    do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}, {EssenceUI.Components.Grid, grid: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default slider with single value.",
        template: """
        <.flex max_width="300px">
          <.slider default_value={[50]} />
        </.flex>
        """
      },
      %Variation{
        id: :range,
        description: "Range slider with two values.",
        template: """
        <.flex max_width="300px">
          <.slider default_value={[25, 75]} />
        </.flex>
        """
      },
      %Variation{
        id: :sizes,
        description: "Slider sizes from 1 to 3.",
        template: """
        <.flex direction="column" gap="4" style="max-width: 300px;">
          <.text size="2">Size 1</.text>
          <.slider size="1" default_value={[25]} />

          <.text size="2">Size 2</.text>
          <.slider size="2" default_value={[50]} />

          <.text size="2">Size 3</.text>
          <.slider size="3" default_value={[75]} />
        </.flex>
        """
      },
      %Variation{
        id: :variants,
        description: "Slider visual variants.",
        template: """
        <.flex direction="column" gap="4" style="max-width: 300px;">
          <.text size="2">Surface</.text>
          <.slider variant="surface" default_value={[25]} />

          <.text size="2">Classic</.text>
          <.slider variant="classic" default_value={[50]} />

          <.text size="2">Soft</.text>
          <.slider variant="soft" default_value={[75]} />
        </.flex>
        """
      },
      %Variation{
        id: :colors,
        description: "Accent color variants.",
        template: """
        <.flex direction="column" gap="4" style="max-width: 300px;">
          <.text size="2">Indigo</.text>
          <.slider color="indigo" default_value={[20]} />

          <.text size="2">Cyan</.text>
          <.slider color="cyan" default_value={[40]} />

          <.text size="2">Orange</.text>
          <.slider color="orange" default_value={[60]} />

          <.text size="2">Crimson</.text>
          <.slider color="crimson" default_value={[80]} />
        </.flex>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast variants.",
        template: """
        <.grid columns="2" gap="4">
          <.flex direction="column" gap="2" style="max-width: 200px;">
            <.text size="2">Regular</.text>
            <.slider color="indigo" default_value={[10]} />
            <.slider color="cyan" default_value={[30]} />
            <.slider color="orange" default_value={[50]} />
            <.slider color="crimson" default_value={[70]} />
            <.slider color="gray" default_value={[90]} />
          </.flex>

          <.flex direction="column" gap="2" style="max-width: 200px;">
            <.text size="2">High Contrast</.text>
            <.slider color="indigo" high_contrast default_value={[10]} />
            <.slider color="cyan" high_contrast default_value={[30]} />
            <.slider color="orange" high_contrast default_value={[50]} />
            <.slider color="crimson" high_contrast default_value={[70]} />
            <.slider color="gray" high_contrast default_value={[90]} />
          </.flex>
        </.grid>
        """
      },
      %Variation{
        id: :radius,
        description: "Border radius variants.",
        template: """
        <.flex direction="column" gap="4" style="max-width: 300px;">
          <.text size="2">None</.text>
          <.slider radius="none" default_value={[25]} />

          <.text size="2">Small</.text>
          <.slider radius="small" default_value={[50]} />

          <.text size="2">Full</.text>
          <.slider radius="full" default_value={[75]} />
        </.flex>
        """
      },
      %Variation{
        id: :custom_range,
        description: "Custom min/max/step values.",
        template: """
        <.flex direction="column" gap="4" style="max-width: 300px;">
          <.text size="2">0-10, step 0.5</.text>
          <.slider min={0} max={10} step={0.5} default_value={[2.5]} />

          <.text size="2">-50 to 50</.text>
          <.slider min={-50} max={50} default_value={[-10, 30]} />
        </.flex>
        """
      },
      %Variation{
        id: :vertical,
        description: "Vertical orientation slider.",
        template: """
        <.flex gap="6" style="height: 200px;">
          <.slider orientation="vertical" default_value={[30]} />
          <.slider orientation="vertical" default_value={[20, 80]} />
          <.slider orientation="vertical" size="3" variant="soft" color="crimson" default_value={[60]} />
        </.flex>
        """
      }
    ]
  end
end
