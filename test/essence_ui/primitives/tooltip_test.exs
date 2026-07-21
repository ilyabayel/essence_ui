defmodule EssenceUI.Primitives.TooltipTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Tooltip

  test "renders provider and radix-like tooltip parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tooltip.provider delay_duration={400}>
            <Tooltip.root id="tip" open_delay={100} close_delay={0} default_open>
              <Tooltip.trigger id="tip-trigger" content_id="tip-content">Hover</Tooltip.trigger>
              <Tooltip.content id="tip-content" side="bottom" align="start">
                Add to library
                <Tooltip.arrow />
              </Tooltip.content>
            </Tooltip.root>
          </Tooltip.provider>
          """
        end,
        %{}
      )

    assert html =~ "data-essence-tooltip-provider"
    assert html =~ ~s[data-delay-duration="400"]
    assert html =~ ~s[phx-hook="TooltipRoot"]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-open-delay="100"]
    assert html =~ "data-essence-tooltip-trigger"
    assert html =~ ~s[aria-describedby="tip-content"]
    assert html =~ "data-essence-tooltip-content"
    assert html =~ ~s[role="tooltip"]
    assert html =~ ~s[data-side="bottom"]
    assert html =~ "data-essence-tooltip-arrow"
    assert html =~ "display: none"
  end

  test "portal thin-wraps Phoenix portal" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tooltip.root id="ported-tip">
            <Tooltip.trigger>Info</Tooltip.trigger>
            <Tooltip.portal id="tip-portal">
              <Tooltip.content>Hint</Tooltip.content>
            </Tooltip.portal>
          </Tooltip.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="tip-portal"]
    assert html =~ "data-essence-tooltip-content"
  end
end
