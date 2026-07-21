defmodule EssenceUI.Primitives.OneTimePasswordFieldTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.OneTimePasswordField

  test "auto-generates character inputs from length" do
    html =
      render_component(&OneTimePasswordField.root/1, %{
        id: "otp",
        length: 6,
        name: "code",
        default_value: "12",
        auto_submit: true,
        on_complete: "done"
      })

    assert html =~ ~s[phx-hook="OneTimePasswordFieldRoot"]
    assert html =~ "data-essence-otp-root"
    assert html =~ ~s[data-length="6"]
    assert html =~ ~s[data-name="code"]
    assert html =~ ~s[data-auto-submit="true"]
    assert html =~ ~s[data-on-complete="done"]
    assert html =~ "data-essence-otp-hidden"
    assert html =~ ~s[name="code"]
    assert html =~ ~s[value="12"]

    assert length(Regex.scan(~r/data-essence-otp-input/, html)) == 6
    assert html =~ ~s[data-index="0"]
    assert html =~ ~s[data-index="5"]
    assert html =~ ~s[value="1"]
    assert html =~ ~s[value="2"]
  end

  test "supports composed input parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <OneTimePasswordField.root id="otp2" length={4} name="pin">
            <OneTimePasswordField.input index={0} />
            <OneTimePasswordField.input index={1} />
            <OneTimePasswordField.input index={2} />
            <OneTimePasswordField.input index={3} />
          </OneTimePasswordField.root>
          """
        end,
        %{}
      )

    assert html =~ "data-essence-otp-hidden"
    assert length(Regex.scan(~r/data-essence-otp-input/, html)) == 4
  end

  test "supports max_length alias and validation attrs" do
    html =
      render_component(&OneTimePasswordField.root/1, %{
        id: "otp3",
        max_length: 4,
        validation_type: "alphanumeric",
        disabled: true
      })

    assert html =~ ~s[data-length="4"]
    assert html =~ ~s[data-validation-type="alphanumeric"]
    assert html =~ "data-disabled"
    assert html =~ ~s[inputmode="text"]
  end
end
