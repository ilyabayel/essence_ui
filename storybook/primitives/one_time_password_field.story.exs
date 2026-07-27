defmodule Storybook.Primitives.OneTimePasswordFieldStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.OneTimePasswordField

  def function, do: &OneTimePasswordField.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "one-time-password-field"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Essence UI one-time password field demo",
        template: """
        <OneTimePasswordField.root
          id="otp-primitive"
          class="DemoOTPRoot"
          length={6}
          name="otp"
        >
          <OneTimePasswordField.input
            class="DemoOTPInput"
            index={0}
          />
          <OneTimePasswordField.input
            class="DemoOTPInput"
            index={1}
          />
          <OneTimePasswordField.input
            class="DemoOTPInput"
            index={2}
          />
          <OneTimePasswordField.input
            class="DemoOTPInput"
            index={3}
          />
          <OneTimePasswordField.input
            class="DemoOTPInput"
            index={4}
          />
          <OneTimePasswordField.input
            class="DemoOTPInput"
            index={5}
          />
        </OneTimePasswordField.root>
        """
      }
    ]
  end
end
