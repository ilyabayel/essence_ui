defmodule Storybook.Primitives.ToggleGroupStory do
  @moduledoc false

  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.ToggleGroup

  def function, do: &ToggleGroup.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :single,
        template: """
        <ToggleGroup.root
          id="alignment"
          type="single"
          default_value="center"
          class="ToggleGroup"
          aria-label="Text alignment"
        >
          <ToggleGroup.item class="ToggleGroupItem" value="left" aria-label="Left aligned">L</ToggleGroup.item>
          <ToggleGroup.item class="ToggleGroupItem" value="center" aria-label="Center aligned">C</ToggleGroup.item>
          <ToggleGroup.item class="ToggleGroupItem" value="right" aria-label="Right aligned">R</ToggleGroup.item>
        </ToggleGroup.root>

        <style>
          .ToggleGroup {
            display: inline-flex;
            background-color: var(--mauve-6, #e6e1e8);
            border-radius: 4px;
            box-shadow: 0 2px 10px var(--black-a7, rgba(0, 0, 0, 0.35));
          }

          .ToggleGroupItem {
            all: unset;
            background-color: white;
            color: var(--mauve-11, #6f6a72);
            height: 35px;
            width: 35px;
            display: flex;
            font-size: 15px;
            line-height: 1;
            align-items: center;
            justify-content: center;
            margin-left: 1px;
            user-select: none;
          }

          .ToggleGroupItem:first-child {
            margin-left: 0;
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
          }

          .ToggleGroupItem:last-child {
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
          }

          .ToggleGroupItem:hover {
            background-color: var(--violet-3, #f1eefe);
          }

          .ToggleGroupItem[data-state="on"] {
            background-color: var(--violet-5, #e4defc);
            color: var(--violet-11, #6550b9);
          }

          .ToggleGroupItem:focus {
            position: relative;
            box-shadow: 0 0 0 2px black;
          }
        </style>
        """
      },
      %Variation{
        id: :multiple,
        template: """
        <ToggleGroup.root
          id="formatting"
          type="multiple"
          value={["bold"]}
          class="ToggleGroup"
          aria-label="Text formatting"
        >
          <ToggleGroup.item class="ToggleGroupItem" value="bold" aria-label="Bold">B</ToggleGroup.item>
          <ToggleGroup.item class="ToggleGroupItem" value="italic" aria-label="Italic">I</ToggleGroup.item>
          <ToggleGroup.item class="ToggleGroupItem" value="underline" aria-label="Underline">U</ToggleGroup.item>
        </ToggleGroup.root>
        """
      }
    ]
  end
end
