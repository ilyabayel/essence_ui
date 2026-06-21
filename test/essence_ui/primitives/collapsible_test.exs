defmodule EssenceUI.Primitives.CollapsibleTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Collapsible

  test "renders radix-like root, trigger, and content" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Collapsible.root id="details" default_open disabled on_open_change="changed">
            <Collapsible.trigger id="details-trigger" content_id="details-content">Toggle</Collapsible.trigger>
            <Collapsible.content id="details-content">Content</Collapsible.content>
          </Collapsible.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="CollapsibleRoot"]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-disabled]
    assert html =~ ~s[data-on-open-change="changed"]
    assert html =~ ~s[id="details-trigger"]
    assert html =~ ~s[aria-controls="details-content"]
    assert html =~ ~s[aria-expanded="false"]
    assert html =~ "data-essence-collapsible-content"
  end
end
