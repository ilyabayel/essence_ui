defmodule EssenceUI.Components.TooltipTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Tooltip

  test "renders themes tooltip over tooltip primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tooltip.tooltip id="tip" content="Hello tip" side="right" align="start" color="blue" open_delay={500} close_delay={200}>
            <button type="button">Hover</button>
          </Tooltip.tooltip>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="TooltipRoot"]
    assert html =~ ~s[data-open-delay="500"]
    assert html =~ ~s[data-close-delay="200"]
    assert html =~ "data-essence-tooltip-trigger"
    assert html =~ "data-essence-tooltip-content"
    assert html =~ "data-essence-tooltip-arrow"
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[role="tooltip"]
    assert html =~ ~s[data-side="right"]
    assert html =~ ~s[data-align="start"]

    assert html =~ "est-TooltipRoot"
    assert html =~ "est-TooltipTrigger"
    assert html =~ ~s[id="tip-trigger"]
    assert html =~ ~r/<div[^>]*id="tip-trigger"/
    assert html =~ "est-TooltipContent"
    assert html =~ "essence-ui"
    assert html =~ "est-TooltipText"
    assert html =~ "est-TooltipArrow"
    assert html =~ ~s[data-accent-color="blue"]
    assert html =~ "Hello tip"
    refute html =~ ~s[phx-hook="Tooltip"]
    # Themes wraps <.button>; trigger must be a div so the nested button is not hoisted
    refute html =~ ~r/<button[^>]*id="tip-trigger"/
  end
end
