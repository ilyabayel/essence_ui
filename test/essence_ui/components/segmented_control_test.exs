defmodule EssenceUI.Components.SegmentedControlTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.SegmentedControl

  test "root wraps ToggleGroup with themes classes" do
    html =
      render_component(&SegmentedControl.segmented_control_root/1, %{
        id: "sc1",
        size: "3",
        variant: "classic",
        color: "blue",
        high_contrast: true,
        value: "inbox",
        inner_block: [%{inner_block: fn _, _ -> "" end}]
      })

    assert html =~ "rt-SegmentedControlRoot"
    assert html =~ "rt-SegmentedControlIndicator"
    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-classic"
    assert html =~ ~s(phx-hook="ToggleGroupRoot")
    assert html =~ "data-radix-toggle-group-root"
    assert html =~ ~s(data-type="single")
    assert html =~ ~s(data-deselectable="false")
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ "rt-high-contrast"
    assert html =~ ~s(data-value="inbox")
  end

  test "item wraps ToggleGroup item with label anatomy" do
    html =
      render_component(&SegmentedControl.segmented_control_item/1, %{
        value: "inbox",
        inner_block: [%{inner_block: fn _, _ -> "Inbox" end}]
      })

    assert html =~ "rt-SegmentedControlItem"
    assert html =~ "rt-SegmentedControlItemSeparator"
    assert html =~ "rt-SegmentedControlItemLabel"
    assert html =~ "rt-SegmentedControlItemLabelActive"
    assert html =~ "rt-SegmentedControlItemLabelInactive"
    assert html =~ "data-radix-toggle-group-item"
    assert html =~ ~s(data-value="inbox")
    assert html =~ "Inbox"
  end

  test "slot convenience segmented_control renders root and options" do
    html =
      render_component(&SegmentedControl.segmented_control/1, %{
        id: "slot-sc",
        default_value: "inbox",
        size: "1",
        color: "indigo",
        option: [
          %{value: "inbox", inner_block: fn _, _ -> "Inbox" end},
          %{value: "drafts", inner_block: fn _, _ -> "Drafts" end}
        ]
      })

    assert html =~ "rt-SegmentedControlRoot"
    assert html =~ ~s(phx-hook="ToggleGroupRoot")
    assert html =~ "rt-r-size-1"
    assert html =~ ~s(data-accent-color="indigo")
    assert html =~ ~s(data-deselectable="false")
    assert html =~ "Inbox"
    assert html =~ "Drafts"
    assert html =~ ~s(data-value="inbox")
  end
end
