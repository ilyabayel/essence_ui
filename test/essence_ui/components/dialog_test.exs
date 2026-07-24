defmodule EssenceUI.Components.DialogTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Dialog

  test "renders themes dialog parts via primitives" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Dialog.dialog_root id="dialog">
            <Dialog.dialog_trigger>Open</Dialog.dialog_trigger>
            <Dialog.dialog_content id="dialog-content">
              <Dialog.dialog_title>Title</Dialog.dialog_title>
              <Dialog.dialog_description>Description</Dialog.dialog_description>
              <Dialog.dialog_close>Close</Dialog.dialog_close>
            </Dialog.dialog_content>
          </Dialog.dialog_root>
          """
        end,
        %{}
      )

    assert html =~ ~s(id="dialog")
    assert html =~ ~s(phx-hook="DialogRoot")
    assert html =~ "data-essence-dialog-trigger"
    assert html =~ "rt-BaseDialogOverlay"
    assert html =~ "rt-DialogOverlay"
    assert html =~ "rt-DialogContent"
    assert html =~ "rt-BaseDialogContent"
    assert html =~ "rt-r-size-3"
    assert html =~ "rt-DialogTitle"
    assert html =~ "rt-DialogDescription"
    assert html =~ "data-essence-dialog-close"
  end
end
