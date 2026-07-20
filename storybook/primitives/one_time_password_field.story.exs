defmodule Storybook.Primitives.OneTimePasswordFieldStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.OneTimePasswordField

  def function, do: &OneTimePasswordField.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless one-time password field primitive",
        template: """
        <OneTimePasswordField.root id="otp-primitive" length={6} name="otp" class="OtpRoot" />

        <style>
          .OtpRoot {
            display: inline-flex; gap: 0.4rem; align-items: center;
          }
          .OtpRoot [data-essence-otp-input] {
            width: 2.25rem; height: 2.5rem; text-align: center;
            font-size: 1.1rem; border: 1px solid #ccc; border-radius: 4px;
          }
          .OtpRoot [data-essence-otp-input]:focus {
            outline: 2px solid #333; outline-offset: 1px;
          }
        </style>
        """
      }
    ]
  end
end
