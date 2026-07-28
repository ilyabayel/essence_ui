defmodule EssenceUI.Components.DialogTest do
  use EssenceUI.ComponentCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Dialog

  test "renders themes dialog over dialog primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Dialog.dialog id="dlg" target="body" default_state="closed" class="extra">
            <p>Dialog body</p>
          </Dialog.dialog>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="DialogRoot"]
    assert html =~ ~s[id="dlg"]
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="dlg-portal"]
    assert html =~ "data-radix-dialog-overlay"
    assert html =~ "data-radix-dialog-content"
    assert html =~ ~s[role="dialog"]
    refute html =~ ~s[role="alertdialog"]
    refute html =~ ~s[phx-hook="Dialog"]

    assert html =~ ""
    assert html =~ "rt-BaseDialogOverlay"
    assert html =~ "rt-BaseDialogScroll"
    assert html =~ "rt-BaseDialogContent"
    assert html =~ "rt-DialogContent"
    assert html =~ "rt-r-size-3"
    assert html =~ "extra"
    assert html =~ "Dialog body"
  end

  test "maps default_state open to data-state open" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Dialog.dialog id="open-dlg" target="body" default_state="open">
            Opened
          </Dialog.dialog>
          """
        end,
        %{}
      )

    assert html =~ ~s[data-state="open"]
    assert html =~ "Opened"
  end
end
