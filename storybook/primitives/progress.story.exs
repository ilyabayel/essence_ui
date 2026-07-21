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
        id: :primitive,
        description: "Radix docs progress demo",
        template: """
        <div class="radix-demo" data-component="progress">
          <Progress.root class="ProgressRoot" value={66} aria-label="Progress">
            <Progress.indicator class="ProgressIndicator" value={66} style="transform: translateX(-34%);" />
          </Progress.root>
        </div>
        """
      }
    ]
  end
end
