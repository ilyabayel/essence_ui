defmodule Storybook.Primitives.CheckboxGroupStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.CheckboxGroup

  def function, do: &CheckboxGroup.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "checkbox-group"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Essence UI checkbox group demo",
        template: """
        <form>
          <CheckboxGroup.root
            id="checkbox-group-primitive"
            class="DemoCheckboxGroupRoot"
            default_value={["fun"]}
            name="traits"
            aria-label="Personality traits"
          >
            <div style="display: flex; align-items: center;">
              <CheckboxGroup.item class="DemoCheckboxGroupItem" value="fun" id="cg1" checked>
                <CheckboxGroup.indicator class="DemoCheckboxGroupIndicator" checked>✓</CheckboxGroup.indicator>
              </CheckboxGroup.item>
              <label class="DemoLabel" for="cg1">Fun</label>
            </div>
            <div style="display: flex; align-items: center;">
              <CheckboxGroup.item class="DemoCheckboxGroupItem" value="serious" id="cg2">
                <CheckboxGroup.indicator class="DemoCheckboxGroupIndicator" />
              </CheckboxGroup.item>
              <label class="DemoLabel" for="cg2">Serious</label>
            </div>
            <div style="display: flex; align-items: center;">
              <CheckboxGroup.item class="DemoCheckboxGroupItem" value="smart" id="cg3">
                <CheckboxGroup.indicator class="DemoCheckboxGroupIndicator" />
              </CheckboxGroup.item>
              <label class="DemoLabel" for="cg3">Smart</label>
            </div>
          </CheckboxGroup.root>
        </form>
        """
      }
    ]
  end
end
