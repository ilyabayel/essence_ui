defmodule EssenceUI.Components do
  @moduledoc false

  defdelegate text(assigns), to: EssenceUI.Components.Text
  defdelegate box(assigns), to: EssenceUI.Components.Box
end
