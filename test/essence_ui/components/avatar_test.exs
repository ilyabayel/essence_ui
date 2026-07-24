defmodule EssenceUI.Components.AvatarTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Avatar

  test "renders avatar with fallback via primitive" do
    html = render_component(&Avatar.avatar/1, %{id: "a1", fallback: "JD"})

    assert html =~ ~s(id="a1")
    assert html =~ ~s(phx-hook="AvatarRoot")
    assert html =~ "rt-AvatarRoot"
    assert html =~ "rt-AvatarFallback"
    assert html =~ "rt-two-letters"
    assert html =~ "JD"
  end

  test "renders avatar with image" do
    html =
      render_component(&Avatar.avatar/1, %{
        id: "a2",
        src: "/avatar.png",
        alt: "Ada",
        fallback: "AB",
        size: "5",
        variant: "solid",
        color: "indigo"
      })

    assert html =~ ~s(phx-hook="AvatarRoot")
    assert html =~ "rt-AvatarImage"
    assert html =~ ~s(src="/avatar.png")
    assert html =~ "rt-r-size-5"
    assert html =~ "rt-variant-solid"
    assert html =~ ~s(data-accent-color="indigo")
  end
end
