defmodule EssenceUI.Primitives.TooltipTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Tooltip

  test "renders provider and  tooltip parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tooltip.provider delay_duration={400}>
            <Tooltip.root id="tip" open_delay={100} close_delay={0} default_open>
              <Tooltip.trigger id="tip-trigger" content_id="tip-content">Hover</Tooltip.trigger>
              <Tooltip.content id="tip-content" side="bottom" align="start">
                Add to library <Tooltip.arrow />
              </Tooltip.content>
            </Tooltip.root>
          </Tooltip.provider>
          """
        end,
        %{}
      )

    assert html =~ "data-radix-tooltip-provider"
    assert html =~ ~s[data-delay-duration="400"]
    assert html =~ ~s[phx-hook="TooltipRoot"]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-open-delay="100"]
    assert html =~ "data-radix-tooltip-trigger"
    assert html =~ ~s[aria-describedby="tip-content"]
    assert html =~ "data-radix-tooltip-content"
    assert html =~ ~s[role="tooltip"]
    assert html =~ ~s[data-side="bottom"]
    assert html =~ "data-radix-tooltip-arrow"
    assert html =~ "display: none"
  end

  test "trigger as=div keeps nested button intact" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tooltip.root id="wrap-tip">
            <Tooltip.trigger as="div" content_id="wrap-content">
              <button type="button">Hover</button>
            </Tooltip.trigger>
            <Tooltip.content id="wrap-content">Hint</Tooltip.content>
          </Tooltip.root>
          """
        end,
        %{}
      )

    assert html =~ ~r/<div[^>]*data-radix-tooltip-trigger/
    assert html =~ ~s[<button type="button">Hover</button>]
    refute html =~ ~r/<button[^>]*data-radix-tooltip-trigger/
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
    assert html =~ "data-radix-tooltip-content"
  end
end
