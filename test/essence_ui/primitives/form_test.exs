defmodule EssenceUI.Primitives.FormTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Form

  test "renders radix-like form parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Form.root id="signup">
            <Form.field name="email" server_invalid>
              <Form.label>Email</Form.label>
              <Form.control>
                <input type="email" name="email" required />
              </Form.control>
              <Form.message match="valueMissing">Required</Form.message>
              <Form.message match="typeMismatch">Invalid email</Form.message>
              <Form.validity_state>
                <span>state</span>
              </Form.validity_state>
            </Form.field>
            <Form.submit>Save</Form.submit>
          </Form.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[id="signup"]
    assert html =~ ~s[phx-hook="FormRoot"]
    assert html =~ "data-essence-form-root"
    assert html =~ "data-essence-form-field"
    assert html =~ ~s[data-name="email"]
    assert html =~ "data-server-invalid"
    assert html =~ "data-invalid"
    assert html =~ "data-essence-form-label"
    assert html =~ "data-essence-form-control"
    assert html =~ "data-essence-form-message"
    assert html =~ ~s[data-match="valueMissing"]
    assert html =~ ~s[data-match="typeMismatch"]
    assert html =~ "data-essence-form-validity-state"
    assert html =~ ~s[type="submit"]
    assert html =~ "data-essence-form-submit"
    assert html =~ "novalidate"
  end

  test "message supports custom match and name" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Form.root id="f">
            <Form.field name="email">
              <Form.control><input name="email" /></Form.control>
            </Form.field>
            <Form.message name="email" match="customError">Custom</Form.message>
          </Form.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-name="email"]
    assert html =~ ~s[data-match="customError"]
    assert html =~ "Custom"
  end
end
