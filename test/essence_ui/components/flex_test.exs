defmodule EssenceUI.Components.FlexTest do
  use ExUnit.Case, async: true
  use Phoenix.Component

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Flex

  test "renders default flex" do
    assigns = %{}
    html = rendered_to_string(~H"""
    <Flex.flex><div>Item</div></Flex.flex>
    """)
    assert html =~ "rt-Flex"
    assert html =~ "flex"
    assert html =~ "<div>Item</div>"
  end

  test "renders with direction, align, justify, and wrap" do
    assigns = %{}
    html = rendered_to_string(~H"""
    <Flex.flex direction="row-reverse" align="center" justify="space-between" wrap="wrap">
      <div>1</div><div>2</div>
    </Flex.flex>
    """)

    assert html =~ "rt-r-fd-row-reverse"
    assert html =~ "rt-r-ai-center"
    assert html =~ "rt-r-jc-space-between"
    assert html =~ "rt-r-fw-wrap"
  end

  test "renders with custom class and style" do
    assigns = %{}
    html = rendered_to_string(~H"""
    <Flex.flex class="custom flexy" style="background: red;">
      <div>Styled</div>
    </Flex.flex>
    """)

    assert html =~ "custom flexy"
    assert html =~ "background: red"
  end

  test "renders as span" do
    assigns = %{}
    html = rendered_to_string(~H"""
    <Flex.flex as="span"><span>Span</span></Flex.flex>
    """)
    assert html =~ "<span"
    assert html =~ "rt-Flex"
    assert html =~ "<span>Span</span>"
  end
end
