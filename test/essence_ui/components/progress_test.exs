defmodule EssenceUI.Components.ProgressTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Progress

  test "renders progress wrapping primitive a11y attrs" do
    html = render_component(&Progress.progress/1, %{value: 50})

    assert html =~ "rt-ProgressRoot"
    assert html =~ "rt-ProgressIndicator"
    assert html =~ ~s[role="progressbar"]
    assert html =~ ~s[aria-valuenow="50"]
    assert html =~ ~s[aria-valuemax="100"]
    assert html =~ ~s[data-state="loading"]
    assert html =~ "--progress-value: 50"
  end

  test "renders with size, variant, and color" do
    html =
      render_component(&Progress.progress/1, %{
        value: 100,
        size: "3",
        variant: "soft",
        color: "green",
        radius: "full"
      })

    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-soft"
    assert html =~ ~s(data-accent-color="green")
    assert html =~ ~s(data-radius="full")
    assert html =~ ~s[data-state="complete"]
  end
end
