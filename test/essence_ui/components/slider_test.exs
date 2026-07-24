defmodule EssenceUI.Components.SliderTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Slider

  test "renders slider via primitive" do
    html = render_component(&Slider.slider/1, %{id: "s1", default_value: [50]})

    assert html =~ ~s(id="s1")
    assert html =~ ~s(phx-hook="SliderRoot")
    assert html =~ "rt-SliderRoot"
    assert html =~ "rt-SliderTrack"
    assert html =~ "rt-SliderRange"
    assert html =~ "rt-SliderThumb"
    assert html =~ ~s(data-essence-slider-thumb)
    assert html =~ "rt-r-size-2"
    assert html =~ "rt-variant-surface"
  end

  test "renders range slider with two thumbs" do
    html =
      render_component(&Slider.slider/1, %{
        id: "s2",
        default_value: [25, 75],
        size: "3",
        variant: "soft",
        color: "blue"
      })

    assert html =~ ~s(role="group")
    assert html =~ ~s(data-value="[25,75]")
    assert html =~ "rt-r-size-3"
    assert html =~ "rt-variant-soft"
    assert html =~ ~s(data-accent-color="blue")
  end
end
