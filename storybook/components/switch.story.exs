defmodule Storybook.Components.SwitchStory do
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

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}]

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
      %VariationGroup{
        id: :variants,
        description: "Switch visual variants.",
        variations: [
          %Variation{
            id: :surface,
            attributes: %{variant: "surface"},
            template: """
            <.switch variant="surface" />
            """
          },
          %Variation{
            id: :classic,
            attributes: %{variant: "classic"},
            template: """
            <.switch variant="classic" />
            """
          },
          %Variation{
            id: :soft,
            attributes: %{variant: "soft"},
            template: """
            <.switch variant="soft" />
            """
          }
        ]
      },
      %VariationGroup{
        id: :sizes,
        description: "Switch sizes.",
        variations: [
          %Variation{
            id: :size1,
            attributes: %{size: "1"},
            template: """
            <.switch size="1" />
            """
          },
          %Variation{
            id: :size2,
            attributes: %{size: "2"},
            template: """
            <.switch size="2" />
            """
          },
          %Variation{
            id: :size3,
            attributes: %{size: "3"},
            template: """
            <.switch size="3" />
            """
          }
        ]
      },
      %VariationGroup{
        id: :colors,
        description: "Accent color variants.",
        variations: [
          %Variation{
            id: :indigo,
            attributes: %{color: "indigo"},
            template: """
            <.switch color="indigo" />
            """
          },
          %Variation{
            id: :crimson,
            attributes: %{color: "crimson"},
            template: """
            <.switch color="crimson" />
            """
          },
          %Variation{
            id: :grass,
            attributes: %{color: "grass"},
            template: """
            <.switch color="grass" />
            """
          },
          %Variation{
            id: :orange,
            attributes: %{color: "orange"},
            template: """
            <.switch color="orange" />
            """
          }
        ]
      },
      %Variation{
        id: :disabled,
        description: "Disabled switch.",
        template: """
        <.switch disabled />
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast variant.",
        template: """
        <.switch high_contrast />
        """
      }
    ]
  end
end
