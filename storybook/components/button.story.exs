defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def container, do: :iframe
  def function, do: &EssenceUI.Components.Button.button/1

  def aliases, do: []
  def imports, do: []

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          class: "",
          disabled: false,
          size: :default,
          variant: :primary
        },
        slots: [
          """
          asdfsadf
          """
        ]
      }
    ]
  end
end
