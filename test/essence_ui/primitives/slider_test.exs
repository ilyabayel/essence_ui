defmodule EssenceUI.Primitives.SliderTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Slider

  test "renders radix-like root, track, range, and thumb" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Slider.root id="slider" default_value={[50]} min={0} max={100} step={1} name="volume">
            <Slider.track>
              <Slider.range />
            </Slider.track>
            <Slider.thumb index={0} />
          </Slider.root>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="SliderRoot")
    assert html =~ ~s(data-essence-slider-root)
    assert html =~ ~s(data-value="[50]")
    assert html =~ ~s(data-min="0")
    assert html =~ ~s(data-max="100")
    assert html =~ ~s(data-step="1")
    assert html =~ ~s(data-name="volume")
    assert html =~ "data-essence-slider-track"
    assert html =~ "data-essence-slider-range"
    assert html =~ "data-essence-slider-thumb"
    assert html =~ ~s(role="slider")
    assert html =~ ~s(data-index="0")
  end

  test "renders multi-thumb as group with JSON value list" do
    values = [25, 75]

    html =
      render_component(
        fn assigns ->
          ~H"""
          <Slider.root id="range" default_value={@values} disabled>
            <Slider.track>
              <Slider.range />
            </Slider.track>
            <Slider.thumb index={0} />
            <Slider.thumb index={1} />
          </Slider.root>
          """
        end,
        %{values: values}
      )

    assert html =~ ~s(role="group")
    assert html =~ ~s(data-value="[25,75]")
    assert html =~ ~s(data-disabled)
    assert html =~ ~s(aria-disabled="true")
  end
end
