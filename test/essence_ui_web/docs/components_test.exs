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
          <.demo heex={~s[<.button>Hi</.button>]}>
            <.button>Hi</.button>
          </.demo>
          """
        end,
        %{}
      )

    assert html =~ "docs-demo__preview"
    assert html =~ "HEEx"
    assert html =~ "rt-Card" or html =~ "docs-demo"
    assert html =~ "&lt;.button&gt;Hi&lt;/.button&gt;" or html =~ "<.button>Hi</.button>"
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
