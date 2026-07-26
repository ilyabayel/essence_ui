defmodule EssenceUI.Components.LinkTest do
  use ExUnit.Case, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  test "renders LiveView navigate attribute" do
    html =
      render_component(
        fn assigns ->
          import EssenceUI.Components

          ~H"""
          <.es_link navigate="/docs/components/button" underline="none">Button</.es_link>
          """
        end,
        %{}
      )

    assert html =~ ~s(data-phx-link="redirect")
    assert html =~ ~s(href="/docs/components/button")
    assert html =~ "est-Link"
    assert html =~ "Button"
  end

  test "renders href links" do
    html =
      render_component(
        fn assigns ->
          import EssenceUI.Components

          ~H"""
          <.es_link href="/getting_started" color="gray">Storybook</.es_link>
          """
        end,
        %{}
      )

    assert html =~ ~s(href="/getting_started")
    assert html =~ "Storybook"
  end
end
