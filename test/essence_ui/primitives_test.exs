defmodule EssenceUI.PrimitivesTest do
  use ExUnit.Case, async: true
  alias EssenceUI.Primitives

  test "data_attributes/2 generates data attributes from assigns" do
    assigns = %{open: true, disabled: false, some_key: "value"}
    keys = [:open, :disabled, :some_key]

    assert Primitives.data_attributes(assigns, keys) == %{
      "data-open" => "true",
      "data-disabled" => "false",
      "data-some-key" => "value"
    }
  end
end
