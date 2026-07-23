defmodule Storybook.Components.DialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Dialog.dialog_root/1

  def imports,
    do: [
      {EssenceUI.Components,
       [
         dialog_trigger: 1,
         dialog_content: 1,
         dialog_title: 1,
         dialog_description: 1,
         dialog_close: 1,
         button: 1,
         text: 1,
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
        <.dialog_root id="dialog">
          <.dialog_trigger>
            <.button>Edit profile</.button>
          </.dialog_trigger>
          <.dialog_content id="dialog-content" target=".psb-sandbox">
            <.dialog_title>Edit profile</.dialog_title>
            <.dialog_description>
              Make changes to your profile here. Click save when you're done.
            </.dialog_description>
            <.flex gap="3" mt="4" justify="end">
              <.dialog_close>
                <.button variant="soft" color="gray">Cancel</.button>
              </.dialog_close>
              <.dialog_close>
                <.button>Save</.button>
              </.dialog_close>
            </.flex>
          </.dialog_content>
        </.dialog_root>
        """
      }
    ]
  end
end
