defmodule EssenceUI.Components.TooltipTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Tooltip

  test "renders themes tooltip over tooltip primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tooltip.tooltip
            id="tip"
            content="Hello tip"
            side="right"
            align="start"
            color="blue"
            open_delay={500}
            close_delay={200}
          >
            <button type="button">Hover</button>
          </Tooltip.tooltip>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="TooltipRoot"]
    assert html =~ ~s[data-open-delay="500"]
    assert html =~ ~s[data-close-delay="200"]
    assert html =~ "data-radix-tooltip-trigger"
    assert html =~ "data-radix-tooltip-content"
    assert html =~ "data-radix-tooltip-arrow"
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[role="tooltip"]
    assert html =~ ~s[data-side="right"]
    assert html =~ ~s[data-align="start"]

    assert html =~ "rt-TooltipRoot"
    assert html =~ "rt-TooltipTrigger"
    assert html =~ ~s[id="tip-trigger"]
    assert html =~ ~r/<div[^>]*id="tip-trigger"/
    assert html =~ "rt-TooltipContent"
    assert html =~ "radix-themes"
    assert html =~ "rt-TooltipText"
    assert html =~ "rt-TooltipArrow"
    assert html =~ ~s[data-accent-color="blue"]
    assert html =~ "Hello tip"
    refute html =~ ~s[phx-hook="Tooltip"]
    # Themes wraps <.button>; trigger must be a div so the nested button is not hoisted
    refute html =~ ~r/<button[^>]*id="tip-trigger"/
  end
end
