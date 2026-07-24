defmodule EssenceUI.Components.ProgressTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Progress

  test "renders progress via primitive" do
    html = render_component(&Progress.progress/1, %{value: 50})

    assert html =~ ~s(role="progressbar")
    assert html =~ "rt-ProgressRoot"
    assert html =~ "rt-ProgressIndicator"
    assert html =~ "--progress-value: 50"
    assert html =~ ~s(aria-valuenow="50")
    assert html =~ "rt-variant-surface"
    assert html =~ "rt-r-size-2"
  end

  test "renders with custom props" do
    html =
      render_component(&Progress.progress/1, %{
        value: 75,
        max: 100,
        size: "3",
        variant: "soft",
        color: "green"
      })

    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-soft"
    assert html =~ ~s(data-accent-color="green")
    assert html =~ "--progress-value: 75"
  end
end
