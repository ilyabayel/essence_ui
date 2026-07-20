defmodule Storybook.Primitives.PasswordToggleFieldStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.PasswordToggleField

  def function, do: &PasswordToggleField.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless password toggle field primitive",
        template: """
        <PasswordToggleField.root id="password-toggle-primitive" class="PasswordToggleRoot">
          <PasswordToggleField.input class="PasswordToggleInput" name="password" placeholder="Password" />
          <PasswordToggleField.toggle class="PasswordToggleButton">
            <PasswordToggleField.icon visible class="PasswordToggleIcon">Hide</PasswordToggleField.icon>
            <PasswordToggleField.icon hidden class="PasswordToggleIcon">Show</PasswordToggleField.icon>
          </PasswordToggleField.toggle>
        </PasswordToggleField.root>

        <style>
          .PasswordToggleRoot {
            display: inline-flex; align-items: center; gap: 0.35rem;
            border: 1px solid #ccc; border-radius: 4px; padding: 0.25rem 0.35rem;
          }
          .PasswordToggleInput { border: none; outline: none; padding: 0.35rem; min-width: 180px; }
          .PasswordToggleButton {
            border: 1px solid #999; background: white; border-radius: 4px;
            padding: 0.25rem 0.5rem; cursor: pointer; font-size: 12px;
          }
          .PasswordToggleIcon { display: inline; }
          .PasswordToggleIcon[hidden] { display: none; }
        </style>
        """
      }
    ]
  end
end
