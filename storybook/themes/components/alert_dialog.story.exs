defmodule Storybook.Themes.Components.AlertDialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.AlertDialog.alert_dialog/1

  def imports,
    do: [
      {EssenceUI.Components.Button, button: 1},
      {EssenceUI.Components.Text, text: 1},
      {EssenceUI.Components.Heading, heading: 1},
      {EssenceUI.Components.Flex, flex: 1}
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
          <.alert_dialog id="alert-dialog" target=".psb-sandbox" default_state="closed">
            <:title>
              Revoke access
            </:title>
            <:description>
              Are you sure? This application will no longer be accessible and any existing sessions will be expired.
            </:description>
            <.flex gap="3" mt="4" justify="end">
              <.button color="gray" variant="soft" phx-click={JS.dispatch("close", to: "#alert-dialog")}>
                Cancel
              </.button>
              <.button phx-click={JS.dispatch("close", to: "#alert-dialog")} color="red">
                Revoke access
              </.button>
            </.flex>
          </.alert_dialog>
          <.button phx-click={JS.dispatch("open", to: "#alert-dialog")} color="red">
            Revoke access
          </.button>
        """
      }
    ]
  end
end
