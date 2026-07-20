defmodule Storybook.Primitives.RadioGroupStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.RadioGroup

  def function, do: &RadioGroup.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Radix docs radio group demo",
        template: """
        <div class="radix-demo" data-component="radio-group">
          <form>
            <RadioGroup.root
              id="radio-group-primitive"
              class="RadioGroupRoot"
              default_value="default"
              aria-label="View density"
            >
              <div style="display: flex; align-items: center;">
                <RadioGroup.item class="RadioGroupItem" value="default" id="r1">
                  <RadioGroup.indicator class="RadioGroupIndicator"><span></span></RadioGroup.indicator>
                </RadioGroup.item>
                <label class="Label" for="r1">Default</label>
              </div>
              <div style="display: flex; align-items: center;">
                <RadioGroup.item class="RadioGroupItem" value="comfortable" id="r2">
                  <RadioGroup.indicator class="RadioGroupIndicator"><span></span></RadioGroup.indicator>
                </RadioGroup.item>
                <label class="Label" for="r2">Comfortable</label>
              </div>
              <div style="display: flex; align-items: center;">
                <RadioGroup.item class="RadioGroupItem" value="compact" id="r3">
                  <RadioGroup.indicator class="RadioGroupIndicator"><span></span></RadioGroup.indicator>
                </RadioGroup.item>
                <label class="Label" for="r3">Compact</label>
              </div>
            </RadioGroup.root>
          </form>
        </div>
        """
      }
    ]
  end
end
