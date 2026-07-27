defmodule Storybook.Primitives.AlertDialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.AlertDialog

  def function, do: &AlertDialog.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "alert-dialog"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless alert dialog primitive",
        template: """
        <AlertDialog.root id="alert-dialog-primitive">
          <AlertDialog.trigger
            id="alert-dialog-trigger"
            class="DemoButton violet"
          >
            Delete account
          </AlertDialog.trigger>
          <AlertDialog.portal id="alert-dialog-portal">
            <AlertDialog.overlay class="DemoAlertDialogOverlay" />
            <AlertDialog.content
              id="alert-dialog-content"
              class="DemoAlertDialogContent"
            >
              <AlertDialog.title class="DemoAlertDialogTitle">Are you absolutely sure?</AlertDialog.title>
              <AlertDialog.description class="DemoAlertDialogDescription">
                This action cannot be undone. This will permanently delete your account and remove your data from our servers.
              </AlertDialog.description>
              <div style="display: flex; gap: 25px; justify-content: flex-end;">
                <AlertDialog.cancel class="DemoButton mauve">Cancel</AlertDialog.cancel>
                <AlertDialog.action class="DemoButton red">Yes, delete account</AlertDialog.action>
              </div>
            </AlertDialog.content>
          </AlertDialog.portal>
        </AlertDialog.root>
        """
      }
    ]
  end
end
