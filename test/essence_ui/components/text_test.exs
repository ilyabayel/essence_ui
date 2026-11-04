defmodule EssenceUI.Components.TextTest do
  use EssenceUI.ComponentCase, async: true

  alias EssenceUI.Components.Text

  test "mt sets the margin class" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Text.text mt="4">Hello</Text.text>
          """
        end,
        %{}
      )

    assert html =~ "rt-Text"
    assert html =~ "rt-r-mt-4"
    assert html =~ "Hello"
  end
end
