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
        <div class="radix-demo" data-component="dialog">
          <Dialog.root id="dialog-primitive">
            <Dialog.trigger id="dialog-trigger" class="Button violet">Edit profile</Dialog.trigger>
            <Dialog.portal id="dialog-portal">
              <Dialog.overlay class="DialogOverlay" />
              <Dialog.content id="dialog-content" class="DialogContent">
                <Dialog.title class="DialogTitle">Edit profile</Dialog.title>
                <Dialog.description class="DialogDescription">
                  Make changes to your profile here. Click save when you're done.
                </Dialog.description>
                <fieldset class="Fieldset">
                  <label class="Label" for="dialog-name">Name</label>
                  <input class="Input" id="dialog-name" value="Pedro Duarte" />
                </fieldset>
                <fieldset class="Fieldset">
                  <label class="Label" for="dialog-username">Username</label>
                  <input class="Input" id="dialog-username" value="@peduarte" />
                </fieldset>
                <div style="display: flex; margin-top: 25px; justify-content: flex-end;">
                  <Dialog.close class="Button green">Save changes</Dialog.close>
                </div>
                <Dialog.close class="IconButton" aria-label="Close">×</Dialog.close>
              </Dialog.content>
            </Dialog.portal>
          </Dialog.root>
        </div>
        """
      }
    ]
  end
end
