defmodule Storybook.Primitives.DirectionProviderStory do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.DirectionProvider

  def function, do: &DirectionProvider.direction_provider/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Direction provider (RTL)",
        template: """
        <div class="radix-demo" data-component="direction-provider">
          <DirectionProvider.direction_provider dir="rtl" style="background: white; color: var(--mauve-12); padding: 20px; border-radius: 6px; width: 260px;">
            <p style="margin: 0 0 10px; font-weight: 500;">من اليمين إلى اليسار</p>
            <div class="SeparatorRoot" style="background: var(--violet-6); height: 1px; margin: 12px 0;"></div>
            <p style="margin: 0; font-size: 14px; color: var(--mauve-11);">Right-to-left reading direction.</p>
          </DirectionProvider.direction_provider>
        </div>
        """
      }
    ]
  end
end
