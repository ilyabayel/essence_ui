defmodule Storybook.Primitives.AccessibleIconStory do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.AccessibleIcon

  def function, do: &AccessibleIcon.accessible_icon/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{label: "Close"},
        slots: ["x"]
      }
    ]
  end
end
