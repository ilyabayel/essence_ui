defmodule Storybook.Primitives.DialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Dialog

  def function, do: &Dialog.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless dialog primitive",
        template: """
        <Dialog.root id="dialog-primitive">
          <Dialog.trigger id="dialog-trigger">Open</Dialog.trigger>
          <Dialog.portal id="dialog-portal">
            <Dialog.overlay />
            <Dialog.content id="dialog-content">
              <Dialog.title>Dialog title</Dialog.title>
              <Dialog.description>Dialog description</Dialog.description>
              <Dialog.close>Close</Dialog.close>
            </Dialog.content>
          </Dialog.portal>
        </Dialog.root>
        """
      }
    ]
  end
end
