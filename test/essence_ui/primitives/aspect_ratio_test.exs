defmodule EssenceUI.Primitives.AspectRatioTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.AspectRatio

  test "renders radix-like wrapper and inner root" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <AspectRatio.aspect_ratio ratio={16 / 9} id="media" class="root">Media</AspectRatio.aspect_ratio>
          """
        end,
        %{}
      )

    assert html =~ "data-radix-aspect-ratio-wrapper"
    assert html =~ "padding-bottom: 56.25%"
    assert html =~ ~s[id="media"]
    assert html =~ ~s[class="root"]
    assert html =~ "position: absolute"
  end
end
