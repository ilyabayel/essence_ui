defmodule EssenceUI.Primitives.PasswordToggleFieldTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.PasswordToggleField

  test "renders radix-like password toggle parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <PasswordToggleField.root id="pw" default_visible on_visibility_change="changed">
            <PasswordToggleField.input name="password" id="pw-input" />
            <PasswordToggleField.toggle id="pw-toggle">
              <PasswordToggleField.icon visible>Hide</PasswordToggleField.icon>
              <PasswordToggleField.icon hidden>Show</PasswordToggleField.icon>
            </PasswordToggleField.toggle>
          </PasswordToggleField.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="PasswordToggleFieldRoot"]
    assert html =~ "data-essence-password-toggle-root"
    assert html =~ ~s[data-visible="true"]
    assert html =~ ~s[data-on-visibility-change="changed"]
    assert html =~ "data-essence-password-toggle-input"
    assert html =~ ~s[type="password"]
    assert html =~ ~s[name="password"]
    assert html =~ "data-essence-password-toggle-toggle"
    assert html =~ ~s[aria-pressed="false"]
    assert html =~ "data-essence-password-toggle-icon"
    assert html =~ "data-visible"
    assert html =~ "data-hidden"
  end

  test "respects visible assign" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <PasswordToggleField.root id="pw2" visible={false}>
            <PasswordToggleField.input />
            <PasswordToggleField.toggle>Toggle</PasswordToggleField.toggle>
          </PasswordToggleField.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-visible="false"]
  end
end
