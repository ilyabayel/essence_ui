defmodule Storybook.Primitives.RadioGroupStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.RadioGroup

  def function, do: &RadioGroup.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "radio-group"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Essence UI radio group demo",
        template: """
        <form>
          <RadioGroup.root
            id="radio-group-primitive"
            class="DemoRadioGroupRoot"
            default_value="default"
            aria-label="View density"
          >
            <div style="display: flex; align-items: center;">
              <RadioGroup.item class="DemoRadioGroupItem" value="default" id="r1">
                <RadioGroup.indicator class="DemoRadioGroupIndicator" />
              </RadioGroup.item>
              <label class="DemoLabel" for="r1">Default</label>
            </div>
            <div style="display: flex; align-items: center;">
              <RadioGroup.item class="DemoRadioGroupItem" value="comfortable" id="r2">
                <RadioGroup.indicator class="DemoRadioGroupIndicator" />
              </RadioGroup.item>
              <label class="DemoLabel" for="r2">Comfortable</label>
            </div>
            <div style="display: flex; align-items: center;">
              <RadioGroup.item class="DemoRadioGroupItem" value="compact" id="r3">
                <RadioGroup.indicator class="DemoRadioGroupIndicator" />
              </RadioGroup.item>
              <label class="DemoLabel" for="r3">Compact</label>
            </div>
          </RadioGroup.root>
        </form>
        """
      }
    ]
  end
end
