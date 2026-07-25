defmodule EssenceUIWeb.Docs.ComponentsTest do
  use ExUnit.Case, async: true

  import Phoenix.Component
  import Phoenix.LiveViewTest

  alias EssenceUIWeb.Docs.Components

  test "props_table reflects button attrs" do
    html =
      render_component(&Components.props_table/1, %{
        module: EssenceUI.Components.Button,
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
          import EssenceUI.Components
          import EssenceUIWeb.Docs.Components

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
    assert html =~ "&lt;.button&gt;Hi&lt;/.button&gt;" or html =~ "<.button>Hi</.button>"
  end
end
