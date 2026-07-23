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
    * `checkbox_cards_root/1` - See `EssenceUI.Components.CheckboxCards`
    * `checkbox_cards_item/1` - See `EssenceUI.Components.CheckboxCards`
    * `checkbox_group/1` - See `EssenceUI.Components.CheckboxGroup`
    * `dialog_root/1` - See `EssenceUI.Components.Dialog`
    * `dialog_trigger/1` - See `EssenceUI.Components.Dialog`
    * `dialog_content/1` - See `EssenceUI.Components.Dialog`
    * `dialog_title/1` - See `EssenceUI.Components.Dialog`
    * `dialog_description/1` - See `EssenceUI.Components.Dialog`
    * `dialog_close/1` - See `EssenceUI.Components.Dialog`
    * `alert_dialog_root/1` - See `EssenceUI.Components.AlertDialog`
    * `alert_dialog_trigger/1` - See `EssenceUI.Components.AlertDialog`
    * `alert_dialog_content/1` - See `EssenceUI.Components.AlertDialog`
    * `alert_dialog_title/1` - See `EssenceUI.Components.AlertDialog`
    * `alert_dialog_description/1` - See `EssenceUI.Components.AlertDialog`
    * `alert_dialog_action/1` - See `EssenceUI.Components.AlertDialog`
    * `alert_dialog_cancel/1` - See `EssenceUI.Components.AlertDialog`
    * `icon_button/1` - See `EssenceUI.Components.IconButton`
    * `progress/1` - See `EssenceUI.Components.Progress`
    * `radio/1` - See `EssenceUI.Components.Radio`
    * `radio_group_root/1` - See `EssenceUI.Components.RadioGroup`
    * `radio_group_item/1` - See `EssenceUI.Components.RadioGroup`
    * `radio_cards_root/1` - See `EssenceUI.Components.RadioCards`
    * `radio_group/1` - See `EssenceUI.Components.RadioGroup`
    * `segmented_control/1` - See `EssenceUI.Components.SegmentedControl`
    * `select_root/1` - See `EssenceUI.Components.Select`
    * `select_trigger/1` - See `EssenceUI.Components.Select`
    * `select_content/1` - See `EssenceUI.Components.Select`
    * `select_item/1` - See `EssenceUI.Components.Select`
    * `select_group/1` - See `EssenceUI.Components.Select`
    * `select_label/1` - See `EssenceUI.Components.Select`
    * `select_separator/1` - See `EssenceUI.Components.Select`
    * `separator/1` - See `EssenceUI.Components.Separator`
    * `skeleton/1` - See `EssenceUI.Components.Skeleton`
    * `scroll_area/1` - See `EssenceUI.Components.ScrollArea`
    * `slider/1` - See `EssenceUI.Components.Slider`
    * `spinner/1` - See `EssenceUI.Components.Spinner`
    * `switch/1` - See `EssenceUI.Components.Switch`
    * `table/1` - See `EssenceUI.Components.Table`
    * `table_header/1` - See `EssenceUI.Components.Table`
    * `table_body/1` - See `EssenceUI.Components.Table`
    * `table_row/1` - See `EssenceUI.Components.Table`
    * `table_cell/1` - See `EssenceUI.Components.Table`
    * `table_column_header_cell/1` - See `EssenceUI.Components.Table`
    * `table_row_header_cell/1` - See `EssenceUI.Components.Table`
    * `text_field/1` - See `EssenceUI.Components.TextField`
    * `text_area/1` - See `EssenceUI.Components.TextArea`
    * `data_list/1` - See `EssenceUI.Components.DataList`
    * `data_list_item/1` - See `EssenceUI.Components.DataList`
    * `hover_card_root/1` - See `EssenceUI.Components.HoverCard`
    * `hover_card_trigger/1` - See `EssenceUI.Components.HoverCard`
    * `hover_card_content/1` - See `EssenceUI.Components.HoverCard`
    * `popover_root/1` - See `EssenceUI.Components.Popover`
    * `popover_trigger/1` - See `EssenceUI.Components.Popover`
    * `popover_content/1` - See `EssenceUI.Components.Popover`
    * `popover_close/1` - See `EssenceUI.Components.Popover`
    * `tab_nav/1` - See `EssenceUI.Components.TabNav`
    * `tab_nav_link/1` - See `EssenceUI.Components.TabNav`
    * `tooltip/1` - See `EssenceUI.Components.Tooltip`

  ### Typography
    * `blockquote/1` - See `EssenceUI.Components.Blockquote`
    * `code/1` - See `EssenceUI.Components.Code`
    * `em/1` - See `EssenceUI.Components.Em`
    * `heading/1` - See `EssenceUI.Components.Heading`
    * `kbd/1` - See `EssenceUI.Components.Kbd`
    * `link/1` - See `EssenceUI.Components.Link`
    * `es_quote/1` - See `EssenceUI.Components.Quote`
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
  alias EssenceUI.Components.Accordion
  alias EssenceUI.Components.CheckboxCards
  alias EssenceUI.Components.ContextMenu
  alias EssenceUI.Components.DataList
  alias EssenceUI.Components.DropdownMenu
  alias EssenceUI.Components.HoverCard
  alias EssenceUI.Components.Popover
  alias EssenceUI.Components.RadioCards
  alias EssenceUI.Components.RadioGroup
  alias EssenceUI.Components.ScrollArea
  alias EssenceUI.Components.Select
  alias EssenceUI.Components.Table
  alias EssenceUI.Components.TabNav
  alias EssenceUI.Components.Tabs

  # Components
  defdelegate accordion(assigns), to: Accordion
  defdelegate accordion_header(assigns), to: Accordion
  defdelegate accordion_trigger(assigns), to: Accordion
  defdelegate accordion_content(assigns), to: Accordion
  defdelegate avatar(assigns), to: EssenceUI.Components.Avatar
  defdelegate badge(assigns), to: EssenceUI.Components.Badge
  defdelegate button(assigns), to: EssenceUI.Components.Button
  defdelegate callout(assigns), to: EssenceUI.Components.Callout
  defdelegate card(assigns), to: EssenceUI.Components.Card
  defdelegate checkbox(assigns), to: EssenceUI.Components.Checkbox
  defdelegate checkbox_cards_root(assigns), to: CheckboxCards
  defdelegate checkbox_cards_item(assigns), to: CheckboxCards
  defdelegate checkbox_group(assigns), to: EssenceUI.Components.CheckboxGroup
  defdelegate context_menu_root(assigns), to: ContextMenu
  defdelegate context_menu_trigger(assigns), to: ContextMenu
  defdelegate context_menu_content(assigns), to: ContextMenu
  defdelegate context_menu_item(assigns), to: ContextMenu
  defdelegate context_menu_group(assigns), to: ContextMenu
  defdelegate context_menu_separator(assigns), to: ContextMenu
  defdelegate context_menu_label(assigns), to: ContextMenu
  defdelegate context_menu_checkbox_item(assigns), to: ContextMenu
  defdelegate context_menu_radio_group(assigns), to: ContextMenu
  defdelegate context_menu_radio_item(assigns), to: ContextMenu
  defdelegate context_menu_sub(assigns), to: ContextMenu
  defdelegate context_menu_sub_trigger(assigns), to: ContextMenu
  defdelegate context_menu_sub_content(assigns), to: ContextMenu
  defdelegate dropdown_menu_root(assigns), to: DropdownMenu
  defdelegate dropdown_menu_trigger(assigns), to: DropdownMenu
  defdelegate dropdown_menu_trigger_icon(assigns), to: DropdownMenu
  defdelegate dropdown_menu_content(assigns), to: DropdownMenu
  defdelegate dropdown_menu_item(assigns), to: DropdownMenu
  defdelegate dropdown_menu_group(assigns), to: DropdownMenu
  defdelegate dropdown_menu_separator(assigns), to: DropdownMenu
  defdelegate dropdown_menu_label(assigns), to: DropdownMenu
  defdelegate dropdown_menu_checkbox_item(assigns), to: DropdownMenu
  defdelegate dropdown_menu_radio_group(assigns), to: DropdownMenu
  defdelegate dropdown_menu_radio_item(assigns), to: DropdownMenu
  defdelegate dropdown_menu_sub(assigns), to: DropdownMenu
  defdelegate dropdown_menu_sub_trigger(assigns), to: DropdownMenu
  defdelegate dropdown_menu_sub_content(assigns), to: DropdownMenu
  defdelegate dialog_root(assigns), to: EssenceUI.Components.Dialog
  defdelegate dialog_trigger(assigns), to: EssenceUI.Components.Dialog
  defdelegate dialog_content(assigns), to: EssenceUI.Components.Dialog
  defdelegate dialog_title(assigns), to: EssenceUI.Components.Dialog
  defdelegate dialog_description(assigns), to: EssenceUI.Components.Dialog
  defdelegate dialog_close(assigns), to: EssenceUI.Components.Dialog
  defdelegate alert_dialog_root(assigns), to: EssenceUI.Components.AlertDialog
  defdelegate alert_dialog_trigger(assigns), to: EssenceUI.Components.AlertDialog
  defdelegate alert_dialog_content(assigns), to: EssenceUI.Components.AlertDialog
  defdelegate alert_dialog_title(assigns), to: EssenceUI.Components.AlertDialog
  defdelegate alert_dialog_description(assigns), to: EssenceUI.Components.AlertDialog
  defdelegate alert_dialog_action(assigns), to: EssenceUI.Components.AlertDialog
  defdelegate alert_dialog_cancel(assigns), to: EssenceUI.Components.AlertDialog
  defdelegate icon_button(assigns), to: EssenceUI.Components.IconButton
  defdelegate progress(assigns), to: EssenceUI.Components.Progress
  defdelegate radio(assigns), to: EssenceUI.Components.Radio
  defdelegate radio_cards_root(assigns), to: RadioCards
  defdelegate radio_cards_item(assigns), to: RadioCards
  defdelegate radio_group_root(assigns), to: RadioGroup
  defdelegate radio_group_item(assigns), to: RadioGroup
  defdelegate segmented_control(assigns), to: EssenceUI.Components.SegmentedControl
  defdelegate select_root(assigns), to: Select
  defdelegate select_trigger(assigns), to: Select
  defdelegate select_content(assigns), to: Select
  defdelegate select_item(assigns), to: Select
  defdelegate select_group(assigns), to: Select
  defdelegate select_label(assigns), to: Select
  defdelegate select_separator(assigns), to: Select
  defdelegate separator(assigns), to: EssenceUI.Components.Separator
  defdelegate skeleton(assigns), to: EssenceUI.Components.Skeleton
  defdelegate scroll_area(assigns), to: ScrollArea
  defdelegate slider(assigns), to: EssenceUI.Components.Slider
  defdelegate spinner(assigns), to: EssenceUI.Components.Spinner
  defdelegate switch(assigns), to: EssenceUI.Components.Switch
  defdelegate table(assigns), to: Table
  defdelegate table_header(assigns), to: Table
  defdelegate table_body(assigns), to: Table
  defdelegate table_row(assigns), to: Table
  defdelegate table_cell(assigns), to: Table
  defdelegate table_column_header_cell(assigns), to: Table
  defdelegate table_row_header_cell(assigns), to: Table
  defdelegate text_field(assigns), to: EssenceUI.Components.TextField
  defdelegate text_area(assigns), to: EssenceUI.Components.TextArea
  defdelegate data_list(assigns), to: DataList
  defdelegate data_list_item(assigns), to: DataList
  defdelegate hover_card_root(assigns), to: HoverCard
  defdelegate hover_card_trigger(assigns), to: HoverCard
  defdelegate hover_card_content(assigns), to: HoverCard
  defdelegate popover_root(assigns), to: Popover
  defdelegate popover_trigger(assigns), to: Popover
  defdelegate popover_content(assigns), to: Popover
  defdelegate popover_close(assigns), to: Popover
  defdelegate popover_anchor(assigns), to: Popover
  defdelegate tab_nav(assigns), to: TabNav
  defdelegate tab_nav_link(assigns), to: TabNav
  defdelegate tooltip(assigns), to: EssenceUI.Components.Tooltip

  # Typography
  defdelegate blockquote(assigns), to: EssenceUI.Components.Blockquote
  defdelegate code(assigns), to: EssenceUI.Components.Code
  defdelegate em(assigns), to: EssenceUI.Components.Em
  defdelegate heading(assigns), to: EssenceUI.Components.Heading
  defdelegate kbd(assigns), to: EssenceUI.Components.Kbd
  defdelegate es_link(assigns), to: EssenceUI.Components.Link
  defdelegate es_quote(assigns), to: EssenceUI.Components.Quote
  defdelegate strong(assigns), to: EssenceUI.Components.Strong
  defdelegate text(assigns), to: EssenceUI.Components.Text

  # Layout
  defdelegate aspect_ratio(assigns), to: EssenceUI.Components.AspectRatio
  defdelegate box(assigns), to: EssenceUI.Components.Box
  defdelegate container(assigns), to: EssenceUI.Components.Container
  defdelegate flex(assigns), to: EssenceUI.Components.Flex
  defdelegate grid(assigns), to: EssenceUI.Components.Grid
  defdelegate section(assigns), to: EssenceUI.Components.Section

  # Overlays
  defdelegate tabs(assigns), to: Tabs
  defdelegate tabs_list(assigns), to: Tabs
end
