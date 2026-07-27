defmodule EssenceUI.Components.AvatarTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Avatar

  test "renders avatar wrapping primitive root hook" do
    html = render_component(&Avatar.avatar/1, %{id: "av1", fallback: "JD"})

    assert html =~ ~s[id="av1"]
    assert html =~ ~s[phx-hook="AvatarRoot"]
    assert html =~ ~s[data-radix-avatar-root]
    assert html =~ "rt-AvatarRoot"
    assert html =~ "rt-AvatarFallback"
    assert html =~ "JD"
  end

  test "renders with image and themes props" do
    html =
      render_component(&Avatar.avatar/1, %{
        id: "av2",
        src: "/avatar.jpg",
        alt: "User",
        fallback: "AB",
        size: "5",
        variant: "solid",
        color: "indigo"
      })

    assert html =~ "rt-r-size-5"
    assert html =~ "rt-variant-solid"
    assert html =~ ~s(data-accent-color="indigo")
    assert html =~ ~s[data-radix-avatar-image]
    assert html =~ ~s[src="/avatar.jpg"]
    assert html =~ "rt-AvatarImage"
  end
end
