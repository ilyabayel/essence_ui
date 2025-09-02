defmodule Storybook.Components.DialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Dialog.dialog/1

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
        <.dialog id="dialog" target=".psb-sandbox" default_state="closed">
          <.heading as="h2" color="indigo">
            Hello, there!
          </.heading>
          <.text my="4">
            This is a dialog example.
          </.text>
          <.flex gap="2" mt="2">
            <.button>
              Apply
            </.button>
            <.button phx-click={JS.dispatch("close", to: "#dialog")} color="red">
              Close
            </.button>
          </.flex>
        </.dialog>
        <.button phx-click={JS.dispatch("open", to: "#dialog")}>
          Open Dialog
        </.button>
        """
      }
    ]
  end
end
