defmodule EssenceUI.Components do
  @moduledoc """
  Entrypoint for all EssenceUI components.

  ## Available Components

    * `text/1` - See `EssenceUI.Components.Text`
    * `box/1` - See `EssenceUI.Components.Box`
    * `em/1` - See `EssenceUI.Components.Em`
    * `link/1` - See `EssenceUI.Components.Link`
    * `avatar/1` - See `EssenceUI.Components.Avatar`

  """

  defdelegate text(assigns), to: EssenceUI.Components.Text
  defdelegate box(assigns), to: EssenceUI.Components.Box
  defdelegate em(assigns), to: EssenceUI.Components.Em
  defdelegate link(assigns), to: EssenceUI.Components.Link
  defdelegate avatar(assigns), to: EssenceUI.Components.Avatar
end
