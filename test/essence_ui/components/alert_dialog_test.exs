defmodule EssenceUI.Components.AlertDialogTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.AlertDialog

  test "renders themes alert dialog parts via primitives" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <AlertDialog.alert_dialog_root id="alert">
            <AlertDialog.alert_dialog_trigger>Delete</AlertDialog.alert_dialog_trigger>
            <AlertDialog.alert_dialog_content id="alert-content">
              <AlertDialog.alert_dialog_title>Confirm</AlertDialog.alert_dialog_title>
              <AlertDialog.alert_dialog_description>Are you sure?</AlertDialog.alert_dialog_description>
              <AlertDialog.alert_dialog_cancel>Cancel</AlertDialog.alert_dialog_cancel>
              <AlertDialog.alert_dialog_action>Continue</AlertDialog.alert_dialog_action>
            </AlertDialog.alert_dialog_content>
          </AlertDialog.alert_dialog_root>
          """
        end,
        %{}
      )

    assert html =~ ~s(phx-hook="AlertDialogRoot")
    assert html =~ "data-essence-alert-dialog-trigger"
    assert html =~ "rt-AlertDialogOverlay"
    assert html =~ "rt-AlertDialogContent"
    assert html =~ ~s(role="alertdialog")
    assert html =~ "rt-AlertDialogTitle"
    assert html =~ "rt-AlertDialogDescription"
    assert html =~ "data-essence-alert-dialog-cancel"
    assert html =~ "data-essence-alert-dialog-action"
  end
end
