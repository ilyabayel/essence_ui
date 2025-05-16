defmodule EssenceUI.SharedProps.TruncateProps do
  @moduledoc """
  Prop definition for truncate (truncate text with ellipsis).
  """

  def truncate_prop_def do
    %{
      truncate: %{type: :boolean, class: "rt-truncate"}
    }
  end

  defmacro truncate_attrs do
    quote do
      attr :truncate, :boolean, doc: "Whether to truncate text with ellipsis when it overflows."
    end
  end
end
