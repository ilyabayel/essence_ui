defmodule EssenceUI.SharedProps.TruncateProps do
  @moduledoc """
  Prop definition for truncate (truncate text with ellipsis).
  """

  def prop_defs do
    %{
      truncate: %{type: :boolean, class: "rt-truncate"}
    }
  end

  defmacro attrs do
    quote do
      attr :truncate, :boolean, doc: "Whether to truncate text with ellipsis when it overflows."
    end
  end
end
