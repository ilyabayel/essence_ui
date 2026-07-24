defmodule EssenceUI.Components.SegmentedControlTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.SegmentedControl

  test "renders themes segmented control via toggle group primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <SegmentedControl.segmented_control id="seg" value="a" size="2" variant="surface" color="blue">
            <SegmentedControl.segmented_control_item value="a">A</SegmentedControl.segmented_control_item>
            <SegmentedControl.segmented_control_item value="b">B</SegmentedControl.segmented_control_item>
          </SegmentedControl.segmented_control>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="ToggleGroupRoot")
    assert html =~ ~s(data-type="single")
    assert html =~ "rt-SegmentedControlRoot"
    assert html =~ "rt-r-size-2"
    assert html =~ "rt-variant-surface"
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ "rt-SegmentedControlItem"
    assert html =~ "rt-SegmentedControlItemLabelActive"
    assert html =~ "rt-SegmentedControlItemLabelInactive"
    assert html =~ "rt-SegmentedControlIndicator"
    assert html =~ ~s(data-essence-toggle-group-item)
  end
end
