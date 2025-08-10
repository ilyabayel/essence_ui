defmodule Storybook.Components.TextAreaStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.TextArea

  def function, do: &TextArea.text_area/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def imports, do: []

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default text area",
        template: """
        <.text_area placeholder="Write something..." />
        """
      },
      %VariationGroup{
        id: :sizes,
        description: "Sizes",
        variations: [
          %Variation{id: :s1, attributes: %{size: "1"}},
          %Variation{id: :s2, attributes: %{size: "2"}},
          %Variation{id: :s3, attributes: %{size: "3"}}
        ]
      },
      %VariationGroup{
        id: :variants,
        description: "Variants",
        variations: [
          %Variation{id: :surface, attributes: %{variant: "surface"}},
          %Variation{id: :classic, attributes: %{variant: "classic"}},
          %Variation{id: :soft, attributes: %{variant: "soft"}}
        ]
      },
      %VariationGroup{
        id: :resize,
        description: "Resize options (applied on root)",
        variations: [
          %Variation{id: :none, attributes: %{resize: "none"}},
          %Variation{id: :both, attributes: %{resize: "both"}},
          %Variation{id: :horizontal, attributes: %{resize: "horizontal"}},
          %Variation{id: :vertical, attributes: %{resize: "vertical"}}
        ]
      },
      %Variation{
        id: :disabled,
        description: "Disabled",
        template: """
        <.text_area placeholder="Disabled" disabled />
        """
      }
    ]
  end
end
