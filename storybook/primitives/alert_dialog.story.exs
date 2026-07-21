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
        <div class="radix-demo" data-component="alert-dialog">
          <AlertDialog.root id="alert-dialog-primitive">
            <AlertDialog.trigger id="alert-dialog-trigger" class="Button violet">Delete account</AlertDialog.trigger>
            <AlertDialog.portal id="alert-dialog-portal">
              <AlertDialog.overlay class="AlertDialogOverlay" />
              <AlertDialog.content id="alert-dialog-content" class="AlertDialogContent">
                <AlertDialog.title class="AlertDialogTitle">Are you absolutely sure?</AlertDialog.title>
                <AlertDialog.description class="AlertDialogDescription">
                  This action cannot be undone. This will permanently delete your account and remove your data from our servers.
                </AlertDialog.description>
                <div style="display: flex; gap: 25px; justify-content: flex-end;">
                  <AlertDialog.cancel class="Button mauve">Cancel</AlertDialog.cancel>
                  <AlertDialog.action class="Button red">Yes, delete account</AlertDialog.action>
                </div>
              </AlertDialog.content>
            </AlertDialog.portal>
          </AlertDialog.root>
        </div>
        """
      }
    ]
  end
end
