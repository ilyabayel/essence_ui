defmodule EssenceUI.Components.SliderTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Slider

  test "renders slider wrapping primitive hook" do
    html = render_component(&Slider.slider/1, %{id: "sl1", default_value: [50]})

    assert html =~ ~s[id="sl1"]
    assert html =~ ~s[phx-hook="SliderRoot"]
    assert html =~ ~s[data-radix-slider-root]
    assert html =~ "rt-SliderRoot"
    assert html =~ "rt-SliderTrack"
    assert html =~ "rt-SliderRange"
    assert html =~ "rt-SliderThumb"
    assert html =~ ~s[data-radix-slider-thumb]
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

    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-soft"
    assert html =~ ~s(data-accent-color="blue")
    assert html =~ ~s[data-index="0"]
    assert html =~ ~s[data-index="1"]
  end
end
