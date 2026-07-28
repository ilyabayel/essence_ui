defmodule EssenceUI.Primitives.TabsTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Tabs

  test "renders root, list, trigger, and content" do
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
    assert html =~ ~s[aria-orientation="horizontal"]
    assert html =~ ~s[role="tab"]
    assert html =~ ~s[data-radix-tabs-trigger]
    assert html =~ ~s[data-radix-collection-item]
    assert html =~ ~s[data-value="a"]
    assert html =~ ~s[role="tabpanel"]
    assert html =~ "data-radix-tabs-content"
    assert html =~ "data-disabled"
  end

  test "SSR marks default tab active and shows its panel without JS" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tabs.root id="tabs" default_value="a">
            <Tabs.list>
              <Tabs.trigger value="a">A</Tabs.trigger>
              <Tabs.trigger value="b">B</Tabs.trigger>
            </Tabs.list>
            <Tabs.content value="a">Panel A</Tabs.content>
            <Tabs.content value="b">Panel B</Tabs.content>
          </Tabs.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[id="tabs-trigger-a"]
    assert html =~ ~s[aria-controls="tabs-content-a"]
    assert html =~ ~s[id="tabs-content-a"]
    assert html =~ ~s[aria-labelledby="tabs-trigger-a"]

    assert html =~ ~s[data-value="a"]
    assert html =~ ~s[data-state="active"]
    assert html =~ ~s[aria-selected="true"]
    assert html =~ ~s[tabindex="0"]

    assert html =~ ~s[data-value="b"]
    assert html =~ ~s[data-state="inactive"]
    assert html =~ ~s[aria-selected="false"]
    assert html =~ ~s[tabindex="-1"]

    # Active panel must not be hidden on first paint; inactive must be.
    refute html =~ ~r/data-value="a"[^>]*\shidden/
    assert html =~ ~r/data-value="b"[^>]*\shidden/
    assert html =~ "Panel A"
    assert html =~ "Panel B"
  end
end
