defmodule EssenceUI.Components.AspectRatioTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.AspectRatio

  test "renders aspect ratio via primitive wrapper" do
    html =
      render_component(&AspectRatio.aspect_ratio/1, %{
        ratio: 16 / 9,
        inner_block: [%{inner_block: fn _, _ -> "Media" end}]
      })

    assert html =~ "data-radix-aspect-ratio-wrapper"
    assert html =~ "padding-bottom: 56.25%"
    assert html =~ "rt-AspectRatio"
    assert html =~ "Media"
  end

  test "accepts string ratio" do
    html =
      render_component(&AspectRatio.aspect_ratio/1, %{
        ratio: "4:3",
        inner_block: [%{inner_block: fn _, _ -> "Media" end}]
      })

    assert html =~ "padding-bottom: 75.0%"
  end
end
