defmodule Storybook.Primitives.AlertDialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.AlertDialog

  def function, do: &AlertDialog.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless alert dialog primitive",
        template: """
        <AlertDialog.root id="alert-dialog-primitive">
          <AlertDialog.trigger id="alert-dialog-trigger">Open</AlertDialog.trigger>
          <AlertDialog.portal id="alert-dialog-portal">
            <AlertDialog.overlay />
            <AlertDialog.content id="alert-dialog-content">
              <AlertDialog.title>Are you sure?</AlertDialog.title>
              <AlertDialog.description>This action cannot be undone.</AlertDialog.description>
              <AlertDialog.cancel>Cancel</AlertDialog.cancel>
              <AlertDialog.action>Continue</AlertDialog.action>
            </AlertDialog.content>
          </AlertDialog.portal>
        </AlertDialog.root>
        """
      }
    ]
  end
end
