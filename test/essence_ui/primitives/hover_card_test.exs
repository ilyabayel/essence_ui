defmodule EssenceUI.Primitives.HoverCardTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.HoverCard

  test "renders radix-like hover card parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <HoverCard.root id="preview" open_delay={100} close_delay={50} default_open>
            <HoverCard.trigger id="preview-trigger" content_id="preview-content">
              @radix
            </HoverCard.trigger>
            <HoverCard.content id="preview-content" side="right" align="start">
              Preview
              <HoverCard.arrow />
            </HoverCard.content>
          </HoverCard.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="HoverCardRoot"]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-open-delay="100"]
    assert html =~ ~s[data-close-delay="50"]
    assert html =~ "data-essence-hover-card-trigger"
    assert html =~ ~s[aria-describedby="preview-content"]
    assert html =~ "data-essence-hover-card-content"
    assert html =~ ~s[data-side="right"]
    assert html =~ "data-essence-hover-card-arrow"
    assert html =~ "display: none"
  end

  test "portal thin-wraps Phoenix portal" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <HoverCard.root id="ported-hover">
            <HoverCard.trigger>Hover</HoverCard.trigger>
            <HoverCard.portal id="hover-portal">
              <HoverCard.content>Card</HoverCard.content>
            </HoverCard.portal>
          </HoverCard.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="hover-portal"]
    assert html =~ "data-essence-hover-card-content"
  end
end
