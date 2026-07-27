defmodule EssenceUI.Components.ThemeTest do
  use ExUnit.Case, async: true

  import EssenceUI.Components
  import Phoenix.Component
  import Phoenix.LiveViewTest

  test "theme renders data attributes and radix-themes class" do
    html =
      render_component(fn assigns ->
        ~H"""
        <.theme accent_color="crimson" gray_color="mauve" radius="full" scaling="105%">
          <.button>Hi</.button>
        </.theme>
        """
      end)

    assert html =~ "radix-themes"
    assert html =~ ~s(data-accent-color="crimson")
    assert html =~ ~s(data-gray-color="mauve")
    assert html =~ ~s(data-radius="full")
    assert html =~ ~s(data-scaling="105%")
    assert html =~ ~s(data-is-root-theme="true")
    assert html =~ "Hi"
  end

  test "theme appearance adds dark class" do
    html =
      render_component(fn assigns ->
        ~H"""
        <.theme appearance="dark" is_root={false}>
          content
        </.theme>
        """
      end)

    assert html =~ ~r/class="[^"]*\bdark\b/
    refute html =~ "dark-theme"
    assert html =~ ~s(data-has-background="true")
    assert html =~ ~s(data-panel-background="solid")
    assert html =~ ~s(data-is-root-theme="false")
  end
end
