defmodule Storybook.Primitives.ProgressStory do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Progress

  def function, do: &Progress.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :loading,
        attributes: %{value: 50},
        template: """
        <Progress.root value={50} style="width: 240px; height: 12px; background: #eee;">
          <Progress.indicator value={50} style="display: block; width: 50%; height: 100%; background: #111;" />
        </Progress.root>
        """
      },
      %Variation{
        id: :indeterminate,
        attributes: %{},
        slots: ["Indeterminate"]
      }
    ]
  end
end
