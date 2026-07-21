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
        id: :primitive,
        description: "Radix docs avatar demo",
        template: """
        <div class="radix-demo" data-component="avatar">
          <div style="display: flex; gap: 20px;">
            <Avatar.root id="avatar-1" class="AvatarRoot">
              <Avatar.image
                class="AvatarImage"
                src="https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?&w=128&h=128&dpr=2&q=80"
                alt="Colm Tuite"
              />
              <Avatar.fallback class="AvatarFallback" delay_ms={600}>CT</Avatar.fallback>
            </Avatar.root>
            <Avatar.root id="avatar-2" class="AvatarRoot">
              <Avatar.image
                class="AvatarImage"
                src="https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-1.2.1&w=128&h=128&dpr=2&q=80"
                alt="Pedro Duarte"
              />
              <Avatar.fallback class="AvatarFallback" delay_ms={600}>JD</Avatar.fallback>
            </Avatar.root>
            <Avatar.root id="avatar-3" class="AvatarRoot">
              <Avatar.fallback class="AvatarFallback">PD</Avatar.fallback>
            </Avatar.root>
          </div>
        </div>
        """
      }
    ]
  end
end
