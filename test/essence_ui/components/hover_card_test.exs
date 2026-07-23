defmodule EssenceUI.Components.HoverCardTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.HoverCard

  test "renders hover card via primitives" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <HoverCard.hover_card_root id="hc1" open_delay={100} close_delay={50}>
            <HoverCard.hover_card_trigger>Hover</HoverCard.hover_card_trigger>
            <HoverCard.hover_card_content id="hc1-content" size="2">
              Preview
            </HoverCard.hover_card_content>
          </HoverCard.hover_card_root>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="HoverCardRoot")
    assert html =~ "rt-HoverCardRoot"
    assert html =~ ~s(data-open-delay="100")
    assert html =~ "rt-HoverCardTrigger"
    assert html =~ "data-essence-hover-card-trigger"
    assert html =~ "rt-HoverCardContent"
    assert html =~ "rt-r-size-2"
    assert html =~ "Preview"
  end
end
