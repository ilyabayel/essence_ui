defmodule Storybook.Themes.Components.Radio do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Radio.radio/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default radio button",
        attributes: %{
          id: "radio-single-default",
          name: "default_example",
          value: "option1"
        }
      },
      %Variation{
        id: :checked,
        description: "Checked radio button",
        attributes: %{
          id: "radio-single-checked",
          name: "checked_example",
          value: "option2",
          checked: true
        }
      },
      %Variation{
        id: :disabled,
        description: "Disabled radio button",
        attributes: %{
          id: "radio-single-disabled",
          name: "disabled_example",
          value: "option3",
          disabled: true
        }
      },
      %Variation{
        id: :disabled_checked,
        description: "Disabled and checked radio button",
        attributes: %{
          id: "radio-single-disabled-checked",
          name: "disabled_checked_example",
          value: "option4",
          disabled: true,
          checked: true
        }
      },
      %Variation{
        id: :sizes,
        description: "Different sizes",
        template: """
        <div style="display: flex; align-items: center; gap: 12px;">
          <.radio name="size_example" value="small" size="1" />
          <.radio name="size_example" value="medium" size="2" />
          <.radio name="size_example" value="large" size="3" />
        </div>
        """
      },
      %Variation{
        id: :variants,
        description: "Different variants",
        template: """
        <div style="display: flex; align-items: center; gap: 12px;">
          <.radio name="variant_example" value="surface" variant="surface" checked />
          <.radio name="variant_example" value="classic" variant="classic" />
          <.radio name="variant_example" value="soft" variant="soft" />
        </div>
        """
      },
      %Variation{
        id: :colors,
        description: "Different colors",
        template: """
        <div style="display: flex; align-items: center; gap: 12px;">
          <.radio name="color_example" value="gray" color="gray" checked />
          <.radio name="color_example" value="gold" color="gold" />
          <.radio name="color_example" value="bronze" color="bronze" />
          <.radio name="color_example" value="brown" color="brown" />
          <.radio name="color_example" value="yellow" color="yellow" />
          <.radio name="color_example" value="amber" color="amber" />
          <.radio name="color_example" value="orange" color="orange" />
          <.radio name="color_example" value="tomato" color="tomato" />
          <.radio name="color_example" value="red" color="red" />
          <.radio name="color_example" value="ruby" color="ruby" />
          <.radio name="color_example" value="crimson" color="crimson" />
          <.radio name="color_example" value="pink" color="pink" />
          <.radio name="color_example" value="plum" color="plum" />
          <.radio name="color_example" value="purple" color="purple" />
          <.radio name="color_example" value="violet" color="violet" />
          <.radio name="color_example" value="iris" color="iris" />
          <.radio name="color_example" value="indigo" color="indigo" />
          <.radio name="color_example" value="blue" color="blue" />
          <.radio name="color_example" value="cyan" color="cyan" />
          <.radio name="color_example" value="teal" color="teal" />
          <.radio name="color_example" value="jade" color="jade" />
          <.radio name="color_example" value="green" color="green" />
          <.radio name="color_example" value="grass" color="grass" />
          <.radio name="color_example" value="lime" color="lime" />
          <.radio name="color_example" value="mint" color="mint" />
          <.radio name="color_example" value="sky" color="sky" />
        </div>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast variant",
        attributes: %{
          id: "radio-single-high-contrast",
          name: "contrast_example",
          value: "high_contrast",
          checked: true,
          high_contrast: true,
          color: "blue"
        }
      },
      %Variation{
        id: :form_example,
        description: "Radio group example",
        template: """
        <div style="display: flex; flex-direction: column; gap: 8px;">
          <label style="display: flex; align-items: center; gap: 8px;">
            <.radio name="size_preference" value="small" />
            <span>Small</span>
          </label>
          <label style="display: flex; align-items: center; gap: 8px;">
            <.radio name="size_preference" value="medium" checked />
            <span>Medium</span>
          </label>
          <label style="display: flex; align-items: center; gap: 8px;">
            <.radio name="size_preference" value="large" />
            <span>Large</span>
          </label>
        </div>
        """
      }
    ]
  end
end
