defmodule EssenceUI.Storybook.Typography.LinkStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Link

  def e_link(assigns) do
    Link.link(assigns)
  end

  def function, do: &e_link/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-accent-color": "indigo",
       "data-gray-color": "slate",
       "data-gray-color": "slate"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default link style.",
        attributes: %{href: "#"},
        slots: ["Link"]
      },
      %VariationGroup{
        id: :underline,
        description: "Underline variants: auto, always, hover, none.",
        variations: [
          %Variation{id: :auto, attributes: %{href: "#", underline: "auto"}, slots: ["Underline auto"]},
          %Variation{id: :always, attributes: %{href: "#", underline: "always"}, slots: ["Underline always"]},
          %Variation{id: :hover, attributes: %{href: "#", underline: "hover"}, slots: ["Underline hover"]},
          %Variation{id: :none, attributes: %{href: "#", underline: "none"}, slots: ["Underline none"]}
        ]
      },
      %VariationGroup{
        id: :colors,
        description: "Accent color variants.",
        variations: [
          %Variation{id: :indigo, attributes: %{href: "#", color: "indigo"}, slots: ["Indigo"]},
          %Variation{id: :crimson, attributes: %{href: "#", color: "crimson"}, slots: ["Crimson"]},
          %Variation{id: :grass, attributes: %{href: "#", color: "grass"}, slots: ["Grass"]},
          %Variation{id: :orange, attributes: %{href: "#", color: "orange"}, slots: ["Orange"]}
        ]
      },
      %VariationGroup{
        id: :high_contrast,
        description: "High contrast mode.",
        template: """
        <div>
          <.psb-variation/>
        </div>
        """,
        variations: [
          %Variation{
            id: :high_contrast,
            attributes: %{href: "#", color: "gray", high_contrast: false},
            slots: ["Low Contrast"]
          },
          %Variation{
            id: :no_high_contrast,
            attributes: %{href: "#", color: "gray", high_contrast: true},
            slots: ["High Contrast"]
          }
        ]
      },
      %Variation{
        id: :external,
        description: "With target and rel attributes.",
        attributes: %{href: "https://elixir-lang.org", target: "_blank", rel: "noopener noreferrer"},
        slots: ["External"]
      }
    ]
  end
end
