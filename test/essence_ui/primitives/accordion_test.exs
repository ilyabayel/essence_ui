defmodule EssenceUI.Primitives.AccordionTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Accordion

  test "renders radix-like root and item attributes" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Accordion.root id="faq" type="single" value="item-1" disabled orientation="horizontal" dir="rtl">
            <Accordion.item id="item-1-root" value="item-1">
              <Accordion.header>
                <Accordion.trigger id="item-1-content" trigger_id="item-1-trigger">Question</Accordion.trigger>
              </Accordion.header>
              <Accordion.content id="item-1-content" trigger_id="item-1-trigger">Answer</Accordion.content>
            </Accordion.item>
          </Accordion.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="AccordionRoot"]
    assert html =~ ~s[data-type="single"]
    assert html =~ ~s[data-value="item-1"]
    assert html =~ ~s[data-disabled]
    assert html =~ ~s[data-orientation="horizontal"]
    assert html =~ ~s[dir="rtl"]
    assert html =~ ~s[data-essence-accordion-item]
    assert html =~ ~s[data-essence-accordion-trigger]
    assert html =~ ~s[aria-controls="item-1-content"]
    assert html =~ ~s[id="item-1-trigger"]
    assert html =~ ~s[role="region"]
    assert html =~ ~s[aria-labelledby="item-1-trigger"]
  end

  test "renders multiple value list" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Accordion.root id="faq" type="multiple" value={["one", "two"]}>
            <Accordion.item id="one-root" value="one">One</Accordion.item>
          </Accordion.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-type="multiple"]
    assert html =~ ~s[data-value="one,two"]
  end
end
