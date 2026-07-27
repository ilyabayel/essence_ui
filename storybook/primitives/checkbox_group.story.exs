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
            class="CheckboxGroupRoot"
            default_value={["fun"]}
            name="traits"
            aria-label="Personality traits"
          >
            <div style="display: flex; align-items: center;">
              <CheckboxGroup.item class="CheckboxGroupItem" value="fun" id="cg1" checked>
                <CheckboxGroup.indicator class="CheckboxGroupIndicator" checked>✓</CheckboxGroup.indicator>
              </CheckboxGroup.item>
              <label class="Label" for="cg1">Fun</label>
            </div>
            <div style="display: flex; align-items: center;">
              <CheckboxGroup.item class="CheckboxGroupItem" value="serious" id="cg2">
                <CheckboxGroup.indicator class="CheckboxGroupIndicator" />
              </CheckboxGroup.item>
              <label class="Label" for="cg2">Serious</label>
            </div>
            <div style="display: flex; align-items: center;">
              <CheckboxGroup.item class="CheckboxGroupItem" value="smart" id="cg3">
                <CheckboxGroup.indicator class="CheckboxGroupIndicator" />
              </CheckboxGroup.item>
              <label class="Label" for="cg3">Smart</label>
            </div>
          </CheckboxGroup.root>
        </form>
        """
      }
    ]
  end
end
