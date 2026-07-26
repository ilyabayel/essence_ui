defmodule EssenceUI.Components.RadioTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Radio

  test "renders themed native radio matching Radix Themes" do
    html =
      render_component(&Radio.radio/1, %{
        name: "size",
        value: "small",
        size: "3",
        variant: "soft",
        color: "blue"
      })

    assert html =~ ~s[type="radio"]
    assert html =~ "est-RadioRoot"
    assert html =~ "est-BaseRadioRoot"
    assert html =~ "est-r-size-3"
    assert html =~ "est-variant-soft"
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ ~s[name="size"]
    assert html =~ ~s[value="small"]
  end
end
