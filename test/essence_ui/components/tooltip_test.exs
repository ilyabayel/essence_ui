defmodule EssenceUI.Components.TooltipTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Tooltip

  test "renders themes tooltip via primitives" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tooltip.tooltip id="tip1" content="Hello">
            <button>Hover</button>
          </Tooltip.tooltip>
          """
        end,
        %{}
      )

    assert html =~ ~s(id="tip1")
    assert html =~ ~s(phx-hook="TooltipRoot")
    assert html =~ "data-essence-tooltip-trigger"
    assert html =~ "rt-TooltipContent"
    assert html =~ "rt-TooltipText"
    assert html =~ "Hello"
    assert html =~ "rt-TooltipArrow"
    assert html =~ "Hover"
  end

  test "applies color and side" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tooltip.tooltip id="tip2" content="Info" side="right" color="red">
            <span>Target</span>
          </Tooltip.tooltip>
          """
        end,
        %{}
      )

    assert html =~ ~s(data-side="right")
    assert html =~ ~s(data-accent-color="red")
  end
end
