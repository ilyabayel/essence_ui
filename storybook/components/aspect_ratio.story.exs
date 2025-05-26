defmodule Storybook.Components.AspectRatio do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.AspectRatio

  def function, do: &AspectRatio.aspect_ratio/1

  def container,
    do: {:div, "data-scaling": "100%", "data-radius": "medium", style: "display: block;", "data-gray-color": "slate"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default_16_9,
        description: "16:9 Aspect Ratio (default usage)",
        attributes: %{ratio: 16 / 9},
        slots: [
          """
          <img src="https://images.unsplash.com/photo-1479030160180-b1860951d696?&auto=format&fit=crop&w=1200&q=80" alt="16:9" style="width: 100%; height: 100%; object-fit: cover;" />
          """
        ]
      },
      %Variation{
        id: :aspect_4_3,
        description: "4:3 Aspect Ratio",
        attributes: %{ratio: 4 / 3},
        slots: [
          """
          <img src="https://images.unsplash.com/photo-1479030160180-b1860951d696?&auto=format&fit=crop&w=1200&q=80" alt="4:3" style="width: 100%; height: 100%; object-fit: cover;" />
          """
        ]
      },
      %Variation{
        id: :aspect_1_1,
        description: "1:1 Aspect Ratio (Square)",
        attributes: %{ratio: 1},
        slots: [
          """
          <img src="https://images.unsplash.com/photo-1479030160180-b1860951d696?&auto=format&fit=crop&w=1200&q=80" alt="1:1" style="width: 100%; height: 100%; object-fit: cover;" />
          """
        ]
      },
      %Variation{
        id: :aspect_float,
        description: "Aspect Ratio as float (2.35)",
        attributes: %{ratio: 2.35},
        slots: [
          """
          <img src="https://images.unsplash.com/photo-1479030160180-b1860951d696?&auto=format&fit=crop&w=1200&q=80" alt="2.35" style="width: 100%; height: 100%; object-fit: cover;" />
          """
        ]
      },
      %Variation{
        id: :custom_content,
        description: "Custom content inside AspectRatio",
        attributes: %{ratio: 3 / 2},
        slots: [
          """
          <div style="display: flex; align-items: center; justify-content: center; width: 100%; height: 100%; background: #eee;">
            <span style="font-size: 2rem;">Centered Text</span>
          </div>
          """
        ]
      }
    ]
  end
end
