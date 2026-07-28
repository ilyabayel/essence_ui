defmodule EssenceUIWeb.Docs.ComponentsTest do
  use ExUnit.Case, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUI.Components.Button
  alias EssenceUIWeb.Docs.Components

  test "props_table reflects button attrs" do
    html =
      render_component(&Components.props_table/1, %{
        module: Button,
        function: :button
      })

    assert html =~ "variant"
    assert html =~ "size"
    assert html =~ "solid"
  end

  test "demo renders preview and heex source" do
    html =
      render_component(
        fn assigns ->
          import Components
          import EssenceUI.Components

          ~H"""
          <.demo>
            <:heex code={~s[<.button>Hi</.button>]}>
              <.button>Hi</.button>
            </:heex>
          </.demo>
          """
        end,
        %{}
      )

    assert html =~ "docs-demo__preview"
    assert html =~ "HEEx"
    assert html =~ "rt-Card" or html =~ "docs-demo"
    # Makeup splits tokens; assert source still contains the button call pieces
    assert html =~ "button"
    assert html =~ "Hi"
    assert html =~ "rt-Button"
  end

  test "primitive demo injects component css into style tag" do
    html =
      render_component(
        fn assigns ->
          import Components

          ~H"""
          <.demo variant="primitive" component="accordion" css={primitive_css("accordion")}>
            <:heex>
              <div class="DemoAccordionRoot">demo</div>
            </:heex>
          </.demo>
          """
        end,
        %{}
      )

    assert html =~ "<style>"
    assert html =~ "DemoAccordionRoot"
    assert html =~ "CSS"
    refute html =~ "@import"
    refute html =~ "phx-hook=\"DocsDemoFrame\""
    # CSS tab is component-only; canvas may appear in a separate preview <style>
    assert html =~ "language-css"
    assert html =~ "class=\"na\"" or html =~ "class=\"nb\""
  end

  test "code_block highlights heex and css" do
    heex =
      render_component(&Components.code_block/1, %{
        code: ~s[<.button variant="solid">Hi</.button>],
        language: "heex"
      })

    assert heex =~ "class=\"nf\""
    assert heex =~ "class=\"na\""
    assert heex =~ "language-heex"

    css =
      render_component(&Components.code_block/1, %{
        code: ".Root { color: red; box-sizing: border-box; }",
        language: "css"
      })

    # Syntect CSS: selectors → na, properties → nb, keywords → no
    assert css =~ "class=\"na\""
    assert css =~ "box-sizing"
    assert css =~ "language-css"
  end

  test "primitive_css loads component styles without canvas" do
    css = Components.primitive_css("dialog")
    refute css =~ "essence-demo"
    assert css =~ "DialogContent"
    refute css =~ "@import"

    alert = Components.primitive_css("alert-dialog")
    refute alert =~ "essence-demo"
    assert alert =~ "DemoAlertDialogContent"
    assert alert =~ "DemoButton"
    refute alert =~ "@import"
  end

  test "props_table uses Essence table and mobile cards" do
    html =
      render_component(&Components.props_table/1, %{
        module: Button,
        function: :button
      })

    assert html =~ "docs-props__card"
    assert html =~ "rt-Table"
    assert html =~ "variant"
  end
end
