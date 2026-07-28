defmodule EssenceUI.Components.RadioTest do
  use EssenceUI.ComponentCase, async: true

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
    assert html =~ "rt-RadioRoot"
    assert html =~ "rt-BaseRadioRoot"
    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-soft"
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ ~s[name="size"]
    assert html =~ ~s[value="small"]
  end
end
