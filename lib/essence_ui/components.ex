defmodule EssenceUI.Components do
  @moduledoc """
  Entrypoint for all EssenceUI components.

  ## Available Components

    * `text/1` - See `EssenceUI.Components.Text`
    * `box/1` - See `EssenceUI.Components.Box`
    * `em/1` - See `EssenceUI.Components.Em`
    * `link/1` - See `EssenceUI.Components.Link`
    * `avatar/1` - See `EssenceUI.Components.Avatar`
    * `badge/1` - See `EssenceUI.Components.Badge`
    * `callout/1` - See `EssenceUI.Components.Callout`
    * `card/1` - See `EssenceUI.Components.Card`
  """

  defdelegate text(assigns), to: EssenceUI.Components.Text
  defdelegate box(assigns), to: EssenceUI.Components.Box
  defdelegate em(assigns), to: EssenceUI.Components.Em
  defdelegate link(assigns), to: EssenceUI.Components.Link
  defdelegate avatar(assigns), to: EssenceUI.Components.Avatar
  defdelegate badge(assigns), to: EssenceUI.Components.Badge
  defdelegate callout(assigns), to: EssenceUI.Components.Callout
  defdelegate card(assigns), to: EssenceUI.Components.Card
end
