defmodule EssenceUI.SharedProps.RadiusProps do
  @moduledoc """
  Radius prop definitions for Box, Flex, and other layout components.
  Inspired by Radix UI Themes radius.props.ts and the provided TypeScript definition.
  """

  @radii ["none", "small", "medium", "large", "full"]

  def prop_defs do
    %{
      radius: %{type: :enum, values: @radii, class: "rt-r-rd", responsive: true, default: nil}
    }
  end

  defmacro attrs do
    quote do
      attr :radius, :string,
        values: unquote(@radii),
        doc: "Border radius utility. Accepts: none, small, medium, large, full. Responsive supported."
    end
  end

  def radii, do: @radii
end
