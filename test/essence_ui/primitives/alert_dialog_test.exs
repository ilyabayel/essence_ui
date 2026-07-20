defmodule EssenceUI.Primitives.AlertDialogTest do
  use EssenceUIWeb.ConnCase, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Primitives.AlertDialog

  test "renders radix-like alert dialog parts" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <AlertDialog.root id="ad" default_open on_open_change="changed">
            <AlertDialog.trigger id="ad-trigger">Open</AlertDialog.trigger>
            <AlertDialog.portal id="ad-portal" target="body">
              <AlertDialog.overlay id="ad-overlay" />
              <AlertDialog.content id="ad-content">
                <AlertDialog.title id="ad-title">Title</AlertDialog.title>
                <AlertDialog.description id="ad-desc">Description</AlertDialog.description>
                <AlertDialog.cancel id="ad-cancel">Cancel</AlertDialog.cancel>
                <AlertDialog.action id="ad-action">Continue</AlertDialog.action>
              </AlertDialog.content>
            </AlertDialog.portal>
          </AlertDialog.root>
          """
        end,
        %{}
      )

    assert html =~ ~s[phx-hook="AlertDialogRoot"]
    assert html =~ ~s[data-state="open"]
    assert html =~ ~s[data-close-on-overlay="false"]
    assert html =~ ~s[data-on-open-change="changed"]
    assert html =~ ~s[data-essence-alert-dialog-trigger]
    assert html =~ ~s[data-phx-portal="body"]
    assert html =~ ~s[role="alertdialog"]
    assert html =~ ~s[aria-modal="true"]
    assert html =~ ~s[data-essence-alert-dialog-content]
    assert html =~ ~s[data-essence-alert-dialog-title]
    assert html =~ ~s[data-essence-alert-dialog-description]
    assert html =~ ~s[data-essence-alert-dialog-cancel]
    assert html =~ ~s[data-essence-alert-dialog-action]
  end
end
