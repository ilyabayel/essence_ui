defmodule Storybook.Components.ButtonStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Button

  def function, do: &Button.button/1

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
        description: "Default button.",
        template: """
        <.button>Button</.button>
        """
      },
      %VariationGroup{
        id: :variants,
        description: "Button variants.",
        variations: [
          %Variation{
            id: :default,
            attributes: %{variant: "classic"},
            slots: ["Classic"]
          },
          %Variation{
            id: :solid,
            attributes: %{variant: "solid"},
            slots: ["Solid"]
          },
          %Variation{
            id: :soft,
            attributes: %{variant: "soft"},
            slots: ["Soft"]
          },
          %Variation{
            id: :surface,
            attributes: %{variant: "surface"},
            slots: ["Surface"]
          },
          %Variation{
            id: :outline,
            attributes: %{variant: "outline"},
            slots: ["Outline"]
          }
        ]
      },
      %Variation{
        id: :ghost,
        description: "Ghost button.",
        template: """
        <.button variant="ghost">Edit profile</.button>
        """
      },
      %VariationGroup{
        id: :colors,
        description: "Accent color variants.",
        variations: [
          %Variation{
            id: :indigo,
            attributes: %{color: "indigo"},
            slots: ["Indigo"]
          },
          %Variation{
            id: :crimson,
            attributes: %{color: "crimson"},
            slots: ["Crimson"]
          },
          %Variation{
            id: :grass,
            attributes: %{color: "grass"},
            slots: ["Grass"]
          },
          %Variation{
            id: :orange,
            attributes: %{color: "orange"},
            slots: ["Orange"]
          }
        ]
      },
      %VariationGroup{
        id: :sizes,
        description: "Button sizes.",
        variations: [
          %Variation{
            id: :size1,
            attributes: %{size: "1"},
            slots: [
              """
              Size 1
              """
            ]
          },
          %Variation{
            id: :size2,
            attributes: %{size: "2"},
            slots: [
              """
              Size 2
              """
            ]
          },
          %Variation{
            id: :size3,
            attributes: %{size: "3"},
            slots: [
              """
              Size 3
              """
            ]
          },
          %Variation{
            id: :size4,
            attributes: %{size: "4"},
            slots: [
              """
              Size 4
              """
            ]
          }
        ]
      },
      %VariationGroup{
        id: :radius,
        description: "Border radius variants.",
        variations: [
          %Variation{id: :none, attributes: %{radius: "none"}, slots: ["None"]},
          %Variation{id: :small, attributes: %{radius: "small"}, slots: ["Small"]},
          %Variation{id: :medium, attributes: %{radius: "medium"}, slots: ["Medium"]},
          %Variation{id: :large, attributes: %{radius: "large"}, slots: ["Large"]},
          %Variation{id: :full, attributes: %{radius: "full"}, slots: ["Full"]}
        ]
      },
      %VariationGroup{
        id: :loading,
        description: "Loading state.",
        variations: [
          %Variation{id: :loading_classic, attributes: %{loading: true, variant: "classic"}, slots: ["Button A"]},
          %Variation{id: :loading_solid, attributes: %{loading: true, variant: "solid"}, slots: ["Button B"]},
          %Variation{id: :loading_soft, attributes: %{loading: true, variant: "soft"}, slots: ["Button C"]},
          %Variation{id: :loading_surface, attributes: %{loading: true, variant: "surface"}, slots: ["Button D"]},
          %Variation{id: :loading_outline, attributes: %{loading: true, variant: "outline"}, slots: ["Button E"]}
        ]
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast",
        template: """
        <.flex mb="2" gap="2">
          <.button color="gray" variant="classic">Button</.button>
          <.button color="gray" variant="solid">Button</.button>
          <.button color="gray" variant="soft">Button</.button>
          <.button color="gray" variant="surface">Button</.button>
          <.button color="gray" variant="outline">Button</.button>
        </.flex>
        <.flex gap="2">
          <.button color="gray" variant="classic" high_contrast>Button</.button>
          <.button color="gray" variant="solid" high_contrast>Button</.button>
          <.button color="gray" variant="soft" high_contrast>Button</.button>
          <.button color="gray" variant="surface" high_contrast>Button</.button>
          <.button color="gray" variant="outline" high_contrast>Button</.button>
        </.flex>
        """
      },
      %Variation{
        id: :disabled,
        description: "Disabled state.",
        template: """
        <.button variant="classic" disabled>Button</.button>
        <.button variant="solid" disabled>Button</.button>
        <.button variant="soft" disabled>Button</.button>
        <.button variant="surface" disabled>Button</.button>
        <.button variant="outline" disabled>Button</.button>
        """
      }
    ]
  end
end
