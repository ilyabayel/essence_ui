defmodule EssenceUI.Components do
  @moduledoc """
  Entrypoint for all EssenceUI components.

  ## Available Components

  ### Components
    * `avatar/1` - See `EssenceUI.Components.Avatar`
    * `badge/1` - See `EssenceUI.Components.Badge`
    * `button/1` - See `EssenceUI.Components.Button`
    * `callout/1` - See `EssenceUI.Components.Callout`
    * `card/1` - See `EssenceUI.Components.Card`
    * `checkbox/1` - See `EssenceUI.Components.Checkbox`
    * `dialog/1` - See `EssenceUI.Components.Dialog`
    * `alert_dialog/1` - See `EssenceUI.Components.AlertDialog`
    * `icon_button/1` - See `EssenceUI.Components.IconButton`
    * `progress/1` - See `EssenceUI.Components.Progress`
    * `segmented_control/1` - See `EssenceUI.Components.SegmentedControl`
    * `select/1` - See `EssenceUI.Components.Select`
    * `separator/1` - See `EssenceUI.Components.Separator`
    * `slider/1` - See `EssenceUI.Components.Slider`
    * `spinner/1` - See `EssenceUI.Components.Spinner`
    * `switch/1` - See `EssenceUI.Components.Switch`
    * `text_field/1` - See `EssenceUI.Components.TextField`
    * `text_area/1` - See `EssenceUI.Components.TextArea`
    * `tooltip/1` - See `EssenceUI.Components.Tooltip`

  ### Typography
    * `blockquote/1` - See `EssenceUI.Components.Blockquote`
    * `code/1` - See `EssenceUI.Components.Code`
    * `em/1` - See `EssenceUI.Components.Em`
    * `heading/1` - See `EssenceUI.Components.Heading`
    * `kbd/1` - See `EssenceUI.Components.Kbd`
    * `link/1` - See `EssenceUI.Components.Link`
    * `quote/1` - See `EssenceUI.Components.Quote`
    * `strong/1` - See `EssenceUI.Components.Strong`
    * `text/1` - See `EssenceUI.Components.Text`

  ### Layout
    * `aspect_ratio/1` - See `EssenceUI.Components.AspectRatio`
    * `box/1` - See `EssenceUI.Components.Box`
    * `container/1` - See `EssenceUI.Components.Container`
    * `flex/1` - See `EssenceUI.Components.Flex`
    * `grid/1` - See `EssenceUI.Components.Grid`
    * `section/1` - See `EssenceUI.Components.Section`
  """

  # Components
  defdelegate avatar(assigns), to: EssenceUI.Components.Avatar
  defdelegate badge(assigns), to: EssenceUI.Components.Badge
  defdelegate button(assigns), to: EssenceUI.Components.Button
  defdelegate callout(assigns), to: EssenceUI.Components.Callout
  defdelegate card(assigns), to: EssenceUI.Components.Card
  defdelegate checkbox(assigns), to: EssenceUI.Components.Checkbox
  defdelegate dialog(assigns), to: EssenceUI.Components.Dialog
  defdelegate alert_dialog(assigns), to: EssenceUI.Components.AlertDialog
  defdelegate icon_button(assigns), to: EssenceUI.Components.IconButton
  defdelegate progress(assigns), to: EssenceUI.Components.Progress
  defdelegate segmented_control(assigns), to: EssenceUI.Components.SegmentedControl
  defdelegate select(assigns), to: EssenceUI.Components.Select
  defdelegate separator(assigns), to: EssenceUI.Components.Separator
  defdelegate slider(assigns), to: EssenceUI.Components.Slider
  defdelegate spinner(assigns), to: EssenceUI.Components.Spinner
  defdelegate switch(assigns), to: EssenceUI.Components.Switch
  defdelegate text_field(assigns), to: EssenceUI.Components.TextField
  defdelegate text_area(assigns), to: EssenceUI.Components.TextArea
  defdelegate tooltip(assigns), to: EssenceUI.Components.Tooltip

  # Typography
  defdelegate blockquote(assigns), to: EssenceUI.Components.Blockquote
  defdelegate code(assigns), to: EssenceUI.Components.Code
  defdelegate em(assigns), to: EssenceUI.Components.Em
  defdelegate heading(assigns), to: EssenceUI.Components.Heading
  defdelegate kbd(assigns), to: EssenceUI.Components.Kbd
  defdelegate link(assigns), to: EssenceUI.Components.Link
  defdelegate quote(assigns), to: EssenceUI.Components.Quote
  defdelegate strong(assigns), to: EssenceUI.Components.Strong
  defdelegate text(assigns), to: EssenceUI.Components.Text

  # Layout
  defdelegate aspect_ratio(assigns), to: EssenceUI.Components.AspectRatio
  defdelegate box(assigns), to: EssenceUI.Components.Box
  defdelegate container(assigns), to: EssenceUI.Components.Container
  defdelegate flex(assigns), to: EssenceUI.Components.Flex
  defdelegate grid(assigns), to: EssenceUI.Components.Grid
  defdelegate section(assigns), to: EssenceUI.Components.Section
end
