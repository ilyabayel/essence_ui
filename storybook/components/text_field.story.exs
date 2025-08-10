defmodule Storybook.Components.TextFieldStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.TextField

  def function, do: &TextField.text_field/1

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
        description: "Default text field",
        template: """
        <.text_field placeholder="Search" />
        """
      },
      %VariationGroup{
        id: :sizes,
        description: "Sizes",
        variations: [
          %Variation{id: :s1, attributes: %{size: "1"}, slots: ["<:slot>🔍</:slot>"]},
          %Variation{id: :s2, attributes: %{size: "2"}, slots: ["<:slot>🔍</:slot>"]},
          %Variation{id: :s3, attributes: %{size: "3"}, slots: ["<:slot>🔍</:slot>"]}
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
        id: :types,
        description: "Input types",
        variations: [
          %Variation{id: :text, attributes: %{type: "text"}, description: "Text"},
          %Variation{id: :email, attributes: %{type: "email"}, description: "Email"},
          %Variation{id: :password, attributes: %{type: "password"}, description: "Password"},
          %Variation{id: :number, attributes: %{type: "number"}, description: "Number"},
          %Variation{id: :date, attributes: %{type: "date"}, description: "Date"}
        ]
      },
      %Variation{
        id: :disabled,
        description: "Disabled",
        template: """
        <.text_field placeholder="Disabled" disabled />
        """
      },
      %Variation{
        id: :with_slots,
        description: "With left and right slots",
        template: """
        <.text_field placeholder="Amount">
          <:slot>$</:slot>
          <:slot side="right">USD</:slot>
        </.text_field>
        """
      }
    ]
  end
end
