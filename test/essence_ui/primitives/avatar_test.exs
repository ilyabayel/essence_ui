defmodule EssenceUI.Primitives.AvatarTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Avatar

  test "renders radix-like structure" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Avatar.root id="avatar">
            <Avatar.image src="/avatar.png" alt="Ada" on_loading_status_change="avatar_status" />
            <Avatar.fallback delay_ms={300}>AB</Avatar.fallback>
          </Avatar.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[id="avatar"]
    assert html =~ ~s[phx-hook="AvatarRoot"]
    assert html =~ "data-essence-avatar-root"
    assert html =~ "data-essence-avatar-image"
    assert html =~ ~s[data-on-loading-status-change="avatar_status"]
    assert html =~ "data-essence-avatar-fallback"
    assert html =~ ~s[data-delay-ms="300"]
  end
end
