defmodule Storybook.Primitives.ToggleStory do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Toggle

  def function, do: &Toggle.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        template: """
        <Toggle.root id="toggle-italic" class="Toggle" aria-label="Toggle italic">
          <span aria-hidden="true" style="font-style: italic; font-weight: 700;">I</span>
        </Toggle.root>

        <style>
          .Toggle {
            all: unset;
            background-color: white;
            color: var(--mauve-11, #6f6a72);
            height: 35px;
            width: 35px;
            border-radius: 4px;
            display: inline-flex;
            font-size: 15px;
            line-height: 1;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 10px var(--black-a7, rgba(0, 0, 0, 0.35));
            user-select: none;
          }

          .Toggle:hover {
            background-color: var(--violet-3, #f1eefe);
          }

          .Toggle[data-state="on"] {
            background-color: var(--violet-5, #e4defc);
            color: var(--violet-11, #6550b9);
          }

          .Toggle:focus {
            box-shadow: 0 0 0 2px black;
          }
        </style>
        """
      },
      %Variation{
        id: :pressed,
        template: """
        <Toggle.root id="toggle-italic-pressed" class="Toggle" pressed aria-label="Toggle italic">
          <span aria-hidden="true" style="font-style: italic; font-weight: 700;">I</span>
        </Toggle.root>
        """
      }
    ]
  end
end
