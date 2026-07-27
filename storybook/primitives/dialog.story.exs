defmodule Storybook.Primitives.DialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Dialog

  def function, do: &Dialog.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "dialog"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless dialog primitive",
        template: """
        <Dialog.root id="dialog-primitive">
          <Dialog.trigger
            id="dialog-trigger"
            class="DemoButton violet"
          >
            Edit profile
          </Dialog.trigger>
          <Dialog.portal id="dialog-portal">
            <Dialog.overlay class="DemoDialogOverlay" />
            <Dialog.content
              id="dialog-content"
              class="DemoDialogContent"
            >
              <Dialog.title class="DemoDialogTitle">Edit profile</Dialog.title>
              <Dialog.description class="DemoDialogDescription">
                Make changes to your profile here. Click save when you're done.
              </Dialog.description>
              <fieldset class="DemoFieldset">
                <label
                  class="DemoLabel"
                  for="dialog-name"
                >
                  Name
                </label>
                <input
                  class="DemoInput"
                  id="dialog-name"
                  value="Pedro Duarte"
                />
              </fieldset>
              <fieldset class="DemoFieldset">
                <label
                  class="DemoLabel"
                  for="dialog-username"
                >
                  Username
                </label>
                <input
                  class="DemoInput"
                  id="dialog-username"
                  value="@peduarte"
                />
              </fieldset>
              <div style="display: flex; margin-top: 25px; justify-content: flex-end;">
                <Dialog.close class="DemoButton green">Save changes</Dialog.close>
              </div>
              <Dialog.close
                class="DemoIconButton"
                aria-label="Close"
              >
                ×
              </Dialog.close>
            </Dialog.content>
          </Dialog.portal>
        </Dialog.root>
        """
      }
    ]
  end
end
