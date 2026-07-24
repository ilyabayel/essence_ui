defmodule Storybook.Themes.Components.SwitchStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Switch

  def function, do: &Switch.switch/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def imports,
    do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}, {EssenceUI.Components.Grid, grid: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default switch in unchecked state.",
        template: """
        <.switch />
        """
      },
      %Variation{
        id: :checked,
        description: "Switch in checked state.",
        template: """
        <.switch checked />
        """
      },
      %Variation{
        id: :variants,
        description: "Switch visual variants.",
        template: """
        <.grid columns="2" gap="2" style="width: max-content;">
          <.switch variant="surface"/>
          <.switch variant="surface" checked/>
          <.switch variant="classic"/>
          <.switch variant="classic" checked/>
          <.switch variant="soft"/>
          <.switch variant="soft" checked/>
        </.grid>
        """
      },
      %VariationGroup{
        id: :sizes,
        description: "Switch sizes.",
        variations: [
          %Variation{
            id: :size1,
            attributes: %{size: "1"}
          },
          %Variation{
            id: :size2,
            attributes: %{size: "2"}
          },
          %Variation{
            id: :size3,
            attributes: %{size: "3"}
          }
        ]
      },
      %VariationGroup{
        id: :colors,
        description: "Accent color variants.",
        variations: [
          %Variation{
            id: :indigo,
            attributes: %{color: "indigo", checked: true}
          },
          %Variation{
            id: :crimson,
            attributes: %{color: "crimson", checked: true}
          },
          %Variation{
            id: :grass,
            attributes: %{color: "grass", checked: true}
          },
          %Variation{
            id: :orange,
            attributes: %{color: "orange", checked: true}
          }
        ]
      },
      %Variation{
        id: :disabled,
        description: "Disabled switch.",
        template: """
        <.switch disabled />
        <.switch disabled checked />
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast variant.",
        template: """
        <.switch high_contrast />
        <.switch high_contrast checked/>
        """
      }
    ]
  end
end
