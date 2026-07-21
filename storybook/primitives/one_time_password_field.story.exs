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
        description: "Radix docs one-time password field demo",
        template: """
        <div class="radix-demo" data-component="one-time-password-field">
          <OneTimePasswordField.root id="otp-primitive" class="OTPRoot" length={6} name="otp">
            <OneTimePasswordField.input class="OTPInput" index={0} />
            <OneTimePasswordField.input class="OTPInput" index={1} />
            <OneTimePasswordField.input class="OTPInput" index={2} />
            <OneTimePasswordField.input class="OTPInput" index={3} />
            <OneTimePasswordField.input class="OTPInput" index={4} />
            <OneTimePasswordField.input class="OTPInput" index={5} />
          </OneTimePasswordField.root>
        </div>
        """
      }
    ]
  end
end
