defmodule EssenceUI.Components.FlexTest do
  use ExUnit.Case, async: true
  use Phoenix.Component

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Flex

  test "renders default flex" do
    html = render_component(&Flex.flex/1, %{inner_block: fn -> "<div>Item</div>" end})
    assert html =~ "rt-Flex"
    assert html =~ "flex"
    assert html =~ "<div>Item</div>"
  end

  test "renders with direction, align, justify, and wrap" do
    html =
      render_component(&Flex.flex/1, %{
        direction: "row-reverse",
        align: "center",
        justify: "between",
        wrap: "wrap",
        inner_block: fn -> "<div>1</div><div>2</div>" end
      })

    assert html =~ "rt-r-fd-row-reverse"
    assert html =~ "rt-r-ai-center"
    assert html =~ "rt-r-jc-between"
    assert html =~ "rt-r-fw-wrap"
  end

  test "renders with custom class and style" do
    html =
      render_component(&Flex.flex/1, %{
        class: "custom flexy",
        style: "background: red;",
        inner_block: fn -> "<div>Styled</div>" end
      })

    assert html =~ "custom flexy"
    assert html =~ "background: red;"
  end

  test "renders as span" do
    html = render_component(&Flex.flex/1, %{as: "span", inner_block: fn -> "<span>Span</span>" end})
    assert html =~ "<span"
    assert html =~ "rt-Flex"
    assert html =~ "<span>Span</span>"
  end
end
