defmodule EssenceUI.Primitives.DialogTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.Dialog

  test "renders radix-like dialog parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Dialog.root id="dlg" default_open on_open_change="changed" modal>
            <Dialog.trigger id="dlg-trigger">Open</Dialog.trigger>
            <Dialog.portal id="dlg-portal" target="body">
              <Dialog.overlay id="dlg-overlay" />
              <Dialog.content id="dlg-content">
                <Dialog.title id="dlg-title">Title</Dialog.title>
                <Dialog.description id="dlg-desc">Description</Dialog.description>
                <Dialog.close id="dlg-close">Close</Dialog.close>
              </Dialog.content>
            </Dialog.portal>
          </Dialog.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="DialogRoot"]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-modal="true"]
    assert html =~ ~s[data-on-open-change="changed"]
    assert html =~ ~s[data-essence-dialog-trigger]
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[id="dlg-portal"]
    assert html =~ ~s[data-essence-dialog-overlay]
    assert html =~ ~s[role="dialog"]
    assert html =~ ~s[aria-modal="true"]
    assert html =~ ~s[data-essence-dialog-content]
    assert html =~ ~s[data-essence-dialog-title]
    assert html =~ ~s[data-essence-dialog-description]
    assert html =~ ~s[data-essence-dialog-close]
    assert html =~ ~s[type="button"]
  end
end
