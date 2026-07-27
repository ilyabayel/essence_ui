defmodule EssenceUI.Components.AlertDialogTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.AlertDialog

  test "renders themes alert dialog over alert dialog primitive" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <AlertDialog.alert_dialog id="ad" target="body" default_state="closed">
            <:title>Revoke access</:title>
            <:description>Are you sure?</:description>
            <button type="button">Confirm</button>
          </AlertDialog.alert_dialog>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="AlertDialogRoot"]
    assert html =~ ~s[id="ad"]
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="ad-portal"]
    assert html =~ "data-radix-alert-dialog-overlay"
    assert html =~ "data-radix-alert-dialog-content"
    assert html =~ "data-radix-alert-dialog-title"
    assert html =~ "data-radix-alert-dialog-description"
    assert html =~ ~s[role="alertdialog"]
    refute html =~ ~s[phx-hook="Dialog"]
    refute html =~ ~s[phx-hook="DialogRoot"]

    assert html =~ ""
    assert html =~ "rt-BaseDialogOverlay"
    assert html =~ "rt-AlertDialogOverlay"
    assert html =~ "rt-BaseDialogContent"
    assert html =~ "rt-AlertDialogContent"
    assert html =~ "Revoke access"
    assert html =~ "Are you sure?"
    assert html =~ "Confirm"
  end
end
