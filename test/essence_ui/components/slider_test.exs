defmodule EssenceUI.Components.SliderTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Slider

  test "renders slider wrapping primitive hook" do
    html = render_component(&Slider.slider/1, %{id: "sl1", default_value: [50]})

    assert html =~ ~s[id="sl1"]
    assert html =~ ~s[phx-hook="SliderRoot"]
    assert html =~ ~s[data-essence-slider-root]
    assert html =~ "est-SliderRoot"
    assert html =~ "est-SliderTrack"
    assert html =~ "est-SliderRange"
    assert html =~ "est-SliderThumb"
    assert html =~ ~s[data-essence-slider-thumb]
  end

  test "renders range slider with themes props" do
    html =
      render_component(&Slider.slider/1, %{
        id: "sl2",
        default_value: [25, 75],
        size: "3",
        variant: "soft",
        color: "blue"
      })

    assert html =~ "est-r-size-3"
    assert html =~ "est-variant-soft"
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ ~s[data-index="0"]
    assert html =~ ~s[data-index="1"]
  end
end
