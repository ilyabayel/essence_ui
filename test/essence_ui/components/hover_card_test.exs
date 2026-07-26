defmodule EssenceUI.Components.HoverCardTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.HoverCard

  test "renders themes hover card over hover card primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <HoverCard.hover_card_root id="hc" open_delay={100} close_delay={50}>
            <HoverCard.hover_card_trigger>@radix</HoverCard.hover_card_trigger>
            <HoverCard.hover_card_content id="hc-content" size="1" side="top">
              Preview
            </HoverCard.hover_card_content>
          </HoverCard.hover_card_root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="HoverCardRoot"]
    assert html =~ ~s[data-open-delay="100"]
    assert html =~ ~s[data-close-delay="50"]
    assert html =~ "data-essence-hover-card-trigger"
    assert html =~ "data-essence-hover-card-content"
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="hc-content-portal"]
    assert html =~ ~s[data-side="top"]

    assert html =~ "est-HoverCardRoot"
    assert html =~ "est-HoverCardTrigger"
    assert html =~ "width: max-content"
    assert html =~ "est-HoverCardContent"
    assert html =~ "est-PopperContent"
    assert html =~ "est-r-size-1"
    assert html =~ "Preview"
    refute html =~ ~s[phx-hook="HoverCard"]
  end
end
