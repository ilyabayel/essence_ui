defmodule Storybook.Primitives.AvatarStory do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Avatar

  def function, do: &Avatar.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :image_with_fallback,
        template: """
        <Avatar.root id="avatar-primitive">
          <Avatar.image src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=80&h=80&fit=crop" alt="User" style="width: 48px; height: 48px; border-radius: 999px;" />
          <Avatar.fallback style="display: inline-flex; width: 48px; height: 48px; align-items: center; justify-content: center; border-radius: 999px; background: #eee;">AB</Avatar.fallback>
        </Avatar.root>
        """
      }
    ]
  end
end
