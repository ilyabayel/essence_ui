defmodule EssenceUI.Components.AspectRatioTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.AspectRatio

  test "renders wrapping primitive ratio wrapper" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <AspectRatio.aspect_ratio ratio={16 / 9}>
            <img src="/x.jpg" alt="x" />
          </AspectRatio.aspect_ratio>
          """
        end,
        %{}
      )

    assert html =~ "rt-AspectRatio"
    assert html =~ ~s[data-radix-aspect-ratio-wrapper]
    assert html =~ "padding-bottom:"
    assert html =~ ~s[src="/x.jpg"]
  end

  test "accepts string ratio" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <AspectRatio.aspect_ratio ratio="4:3">
            <span>child</span>
          </AspectRatio.aspect_ratio>
          """
        end,
        %{}
      )

    # 4:3 → 100 / (4/3) = 75%
    assert html =~ "padding-bottom: 75.0%"
  end
end
