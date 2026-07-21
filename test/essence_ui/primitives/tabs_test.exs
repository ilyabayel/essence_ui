defmodule EssenceUI.Primitives.TabsTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Tabs

  test "renders radix-like root, list, trigger, and content" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tabs.root id="tabs" default_value="a" orientation="horizontal" on_value_change="changed">
            <Tabs.list>
              <Tabs.trigger value="a">A</Tabs.trigger>
              <Tabs.trigger value="b" disabled>B</Tabs.trigger>
            </Tabs.list>
            <Tabs.content value="a">Panel A</Tabs.content>
            <Tabs.content value="b">Panel B</Tabs.content>
          </Tabs.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="TabsRoot"]
    assert html =~ ~s[data-value="a"]
    assert html =~ ~s[data-orientation="horizontal"]
    assert html =~ ~s[data-on-value-change="changed"]
    assert html =~ ~s[role="tablist"]
    assert html =~ ~s[role="tab"]
    assert html =~ ~s[data-essence-tabs-trigger]
    assert html =~ ~s[data-value="a"]
    assert html =~ ~s[role="tabpanel"]
    assert html =~ "data-essence-tabs-content"
    assert html =~ "data-disabled"
  end
end
