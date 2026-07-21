defmodule EssenceUI.Primitives.ToastTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Toast

  test "renders provider with duration, swipe direction, and label" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toast.provider duration={4000} swipe_direction="left" label="Alert">
            <span>child</span>
          </Toast.provider>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-essence-toast-provider]
    assert html =~ ~s[data-duration="4000"]
    assert html =~ ~s[data-swipe-direction="left"]
    assert html =~ ~s[data-label="Alert"]
  end

  test "renders radix-like root with open state and hook" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toast.root id="toast-1" type="foreground" duration={2000} on_open_change="changed">
            <Toast.title>Title</Toast.title>
            <Toast.description>Body</Toast.description>
          </Toast.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[id="toast-1"]
    assert html =~ ~s[phx-hook="ToastRoot"]
    assert html =~ ~s[data-essence-toast-root]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-type="foreground"]
    assert html =~ ~s[data-duration="2000"]
    assert html =~ ~s[data-on-open-change="changed"]
    assert html =~ ~s[aria-live="assertive"]
    assert html =~ ~s[data-essence-toast-title]
    assert html =~ ~s[data-essence-toast-description]
    refute html =~ " hidden"
  end

  test "renders closed root when open is false" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toast.root id="toast-closed" open={false}>
            <Toast.title>Hidden</Toast.title>
          </Toast.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-state="closed"]
    assert html =~ "hidden"
  end

  test "renders background type with polite aria-live" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toast.root id="toast-bg" type="background">
            <Toast.description>Background</Toast.description>
          </Toast.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-type="background"]
    assert html =~ ~s[aria-live="polite"]
  end

  test "renders action with required alt_text and close button" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toast.root id="toast-action">
            <Toast.action alt_text="Goto schedule to undo">Undo</Toast.action>
            <Toast.close aria-label="Close">×</Toast.close>
          </Toast.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-essence-toast-action]
    assert html =~ ~s[data-alt-text="Goto schedule to undo"]
    assert html =~ ~s[data-essence-toast-close]
  end

  test "renders viewport with hotkey, label, and hook" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Toast.viewport id="vp" hotkey="F8" label="Notifications ({hotkey})">
            <Toast.root id="toast-in-vp"><Toast.title>Hi</Toast.title></Toast.root>
          </Toast.viewport>
          """
        end,
        %{}
      )

    assert html =~ ~s[id="vp"]
    assert html =~ ~s[phx-hook="ToastViewport"]
    assert html =~ ~s[data-essence-toast-viewport]
    assert html =~ ~s[data-hotkey="F8"]
    assert html =~ ~s[aria-label="Notifications (F8)"]
  end
end
