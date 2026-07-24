defmodule EssenceUI.Components.TabsTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Tabs

  test "renders themes tabs parts via primitives" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Tabs.tabs_root id="tabs" default_value="a">
            <Tabs.tabs_list size="2" color="blue">
              <Tabs.tabs_trigger value="a">A</Tabs.tabs_trigger>
              <Tabs.tabs_trigger value="b" disabled>B</Tabs.tabs_trigger>
            </Tabs.tabs_list>
            <Tabs.tabs_content value="a">Panel A</Tabs.tabs_content>
            <Tabs.tabs_content value="b">Panel B</Tabs.tabs_content>
          </Tabs.tabs_root>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="TabsRoot")
    assert html =~ "rt-TabsRoot"
    assert html =~ "rt-BaseTabList"
    assert html =~ "rt-TabsList"
    assert html =~ "rt-r-size-2"
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ "rt-TabsTrigger"
    assert html =~ "rt-BaseTabListTriggerInner"
    assert html =~ "rt-TabsTriggerInner"
    assert html =~ "rt-BaseTabListTriggerInnerHidden"
    assert html =~ "rt-TabsTriggerInnerHidden"
    assert html =~ "rt-TabsContent"
    assert html =~ ~s(data-essence-tabs-trigger)
    assert html =~ "data-disabled"
  end
end
