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
    * `checkbox/1` - See `EssenceUI.Components.Checkbox`
    * `segmented_control/1` - See `EssenceUI.Components.SegmentedControl`
    * `switch/1` - See `EssenceUI.Components.Switch`
    * `slider/1` - See `EssenceUI.Components.Slider`
    * `dialog/1` - See `EssenceUI.Components.Dialog`
  """

  defdelegate text(assigns), to: EssenceUI.Components.Text
  defdelegate box(assigns), to: EssenceUI.Components.Box
  defdelegate em(assigns), to: EssenceUI.Components.Em
  defdelegate link(assigns), to: EssenceUI.Components.Link
  defdelegate avatar(assigns), to: EssenceUI.Components.Avatar
  defdelegate badge(assigns), to: EssenceUI.Components.Badge
  defdelegate callout(assigns), to: EssenceUI.Components.Callout
  defdelegate card(assigns), to: EssenceUI.Components.Card
  defdelegate checkbox(assigns), to: EssenceUI.Components.Checkbox
  defdelegate text_field(assigns), to: EssenceUI.Components.TextField
  defdelegate text_area(assigns), to: EssenceUI.Components.TextArea
  defdelegate select(assigns), to: EssenceUI.Components.Select
  defdelegate segmented_control(assigns), to: EssenceUI.Components.SegmentedControl
  defdelegate switch(assigns), to: EssenceUI.Components.Switch
  defdelegate slider(assigns), to: EssenceUI.Components.Slider
  defdelegate dialog(assigns), to: EssenceUI.Components.Dialog
end
