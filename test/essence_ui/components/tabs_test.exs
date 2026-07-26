defmodule EssenceUI.Components.TabsTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Tabs

  test "renders tabs wrapping primitive hook" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tabs.tabs id="t1" default_value="a" color="blue">
            <:list>
              <Tabs.tabs_list>
                <:trigger value="a">A</:trigger>
                <:trigger value="b">B</:trigger>
              </Tabs.tabs_list>
            </:list>
            <:content value="a">Panel A</:content>
            <:content value="b">Panel B</:content>
          </Tabs.tabs>
          """
        end,
        %{}
      )

    assert html =~ ~s[id="t1"]
    assert html =~ ~s[phx-hook="TabsRoot"]
    assert html =~ ~s[data-essence-tabs-root]
    assert html =~ "est-TabsRoot"
    assert html =~ "est-TabsList"
    assert html =~ ~s[data-essence-tabs-trigger]
    assert html =~ ~s[data-essence-tabs-content]
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ "Panel A"
  end
end
