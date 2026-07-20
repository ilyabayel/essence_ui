defmodule Storybook.Primitives.SeparatorStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Separator

  def function, do: &Separator.separator/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Radix docs separator demo",
        template: """
        <div class="radix-demo" data-component="separator">
          <div style="width: 100%; max-width: 300px; margin: 0 15px;">
            <div class="Text" style="font-weight: 500;">Radix Primitives</div>
            <div class="Text">An open-source UI component library.</div>
            <Separator.separator class="SeparatorRoot" style="margin: 15px 0;" />
            <div style="display: flex; height: 20px; align-items: center;">
              <div class="Text">Blog</div>
              <Separator.separator class="SeparatorRoot" decorative orientation="vertical" style="margin: 0 15px;" />
              <div class="Text">Docs</div>
              <Separator.separator class="SeparatorRoot" decorative orientation="vertical" style="margin: 0 15px;" />
              <div class="Text">Source</div>
            </div>
          </div>
        </div>
        """
      }
    ]
  end
end
