defmodule Storybook.Components.AlertDialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.AlertDialog.alert_dialog_root/1

  def imports,
    do: [
      {EssenceUI.Components,
       [
         alert_dialog_trigger: 1,
         alert_dialog_content: 1,
         alert_dialog_title: 1,
         alert_dialog_description: 1,
         alert_dialog_action: 1,
         alert_dialog_cancel: 1,
         button: 1,
         flex: 1
       ]}
    ]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block; padding: 20px; z-index: 1000;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        template: """
        <.alert_dialog_root id="alert-dialog">
          <.alert_dialog_trigger>
            <.button color="red">Revoke access</.button>
          </.alert_dialog_trigger>
          <.alert_dialog_content id="alert-dialog-content" target=".psb-sandbox">
            <.alert_dialog_title>Revoke access</.alert_dialog_title>
            <.alert_dialog_description>
              Are you sure? This application will no longer be accessible and any existing sessions will be expired.
            </.alert_dialog_description>
            <.flex gap="3" mt="4" justify="end">
              <.alert_dialog_cancel>
                <.button color="gray" variant="soft">Cancel</.button>
              </.alert_dialog_cancel>
              <.alert_dialog_action>
                <.button color="red">Revoke access</.button>
              </.alert_dialog_action>
            </.flex>
          </.alert_dialog_content>
        </.alert_dialog_root>
        """
      }
    ]
  end
end
