defmodule Storybook.Components.Avatar do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Avatar.avatar/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def imports, do: [{EssenceUI.Components.Text, text: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default avatar with initials",
        attributes: %{
          fallback: "JD"
        }
      },
      %Variation{
        id: :with_image,
        description: "Avatar with image source",
        attributes: %{
          src: "https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?&w=128&h=128&dpr=2&q=80&crop=faces&fit=crop",
          fallback: "JD",
          alt: "John Doe"
        }
      },
      %Variation{
        id: :single_letter,
        description: "Avatar with single letter",
        attributes: %{
          fallback: "J"
        }
      },
      %Variation{
        id: :fallback_as_html,
        description: "Raw html as fallback",
        attributes: %{
          fallback:
            Phoenix.HTML.raw("""
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" style="width: 60%; height: 60%;">
              <path fill-rule="evenodd" d="M7.5 6a4.5 4.5 0 119 0 4.5 4.5 0 01-9 0zM3.751 20.105a8.25 8.25 0 0116.498 0 .75.75 0 01-.437.695A18.683 18.683 0 0112 22.5c-2.786 0-5.433-.608-7.812-1.7a.75.75 0 01-.437-.695z" clip-rule="evenodd" />
            </svg>
            """)
        }
      },
      %Variation{
        id: :fallback_as_other_component,
        description: "Other component as fallback",
        template: """
        <.avatar>
          <:fallback_slot>
            <.text>AA</.text>
          </:fallback_slot>
        </.avatar>
        """
      },
      %Variation{
        id: :sizes,
        description: "Avatar sizes",
        template: """
        <div style="display: flex; align-items: end; gap: 16px;">
          <.avatar size="1" fallback="1" />
          <.avatar size="2" fallback="2" />
          <.avatar size="3" fallback="3" />
          <.avatar size="4" fallback="4" />
          <.avatar size="5" fallback="5" />
          <.avatar size="6" fallback="6" />
          <.avatar size="7" fallback="7" />
          <.avatar size="8" fallback="8" />
          <.avatar size="9" fallback="9" />
        </div>
        """
      },
      %Variation{
        id: :variants,
        description: "Avatar variants",
        template: """
        <div style="display: flex; align-items: center; gap: 16px;">
          <.avatar variant="soft" fallback="S" />
          <.avatar variant="solid" fallback="S" />
        </div>
        """
      },
      %Variation{
        id: :colors,
        description: "Avatar colors",
        template: """
        <div style="display: flex; align-items: center; gap: 16px; flex-wrap: wrap;">
        <.avatar color="gray" fallback="G" />
        <.avatar color="gold" fallback="G" />
        <.avatar color="bronze" fallback="B" />
          <.avatar color="brown" fallback="B" />
          <.avatar color="yellow" fallback="Y" />
          <.avatar color="amber" fallback="A" />
          <.avatar color="orange" fallback="O" />
          <.avatar color="tomato" fallback="T" />
          <.avatar color="red" fallback="R" />
          <.avatar color="ruby" fallback="R" />
          <.avatar color="crimson" fallback="C" />
          <.avatar color="pink" fallback="P" />
          <.avatar color="plum" fallback="P" />
          <.avatar color="purple" fallback="P" />
          <.avatar color="violet" fallback="V" />
          <.avatar color="iris" fallback="I" />
          <.avatar color="indigo" fallback="I" />
          <.avatar color="blue" fallback="B" />
          <.avatar color="cyan" fallback="C" />
          <.avatar color="teal" fallback="T" />
          <.avatar color="jade" fallback="J" />
          <.avatar color="green" fallback="G" />
          <.avatar color="grass" fallback="G" />
          <.avatar color="lime" fallback="L" />
          <.avatar color="mint" fallback="M" />
          <.avatar color="sky" fallback="S" />
        </div>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast avatars",
        template: """
        <div style="display: flex; align-items: center; gap: 16px; margin-bottom: 16px;">
          <.avatar variant="solid" color="indigo" fallback="S" />
          <.avatar variant="solid" color="blue" fallback="S" />
          <.avatar variant="solid" color="orange" fallback="S" />
          <.avatar variant="solid" color="pink" fallback="S" />
          <.avatar variant="solid" color="gray" fallback="S" />
        </div>
        <div style="display: flex; align-items: center; gap: 16px;">
          <.avatar variant="solid" color="indigo" high_contrast fallback="S" />
          <.avatar variant="solid" color="blue" high_contrast fallback="S" />
          <.avatar variant="solid" color="orange" high_contrast fallback="S" />
          <.avatar variant="solid" color="pink" high_contrast fallback="S" />
          <.avatar variant="solid" color="gray" high_contrast fallback="S" />
        </div>
        """
      },
      %Variation{
        id: :radius,
        description: "Avatar radius variations",
        template: """
        <div style="display: flex; align-items: center; gap: 16px;">
          <.avatar radius="none" fallback="N" />
          <.avatar radius="small" fallback="S" />
          <.avatar radius="medium" fallback="M" />
          <.avatar radius="large" fallback="L" />
          <.avatar radius="full" fallback="F" />
        </div>
        """
      }
    ]
  end
end
