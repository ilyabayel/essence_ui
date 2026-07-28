/**
 * Essence UI LiveView hooks for consumers.
 *
 * Import and merge into your LiveSocket hooks:
 *
 *   import { hooks as essenceHooks } from "../deps/essence_ui/assets/js/essence_ui"
 *   const liveSocket = new LiveSocket("/live", Socket, {
 *     hooks: { ...essenceHooks },
 *     params: { _csrf_token: csrfToken },
 *   })
 */
import { Dialog } from "./hooks/dialog";
import { DialogRoot, AlertDialogRoot } from "./hooks/dialog_root";
import { Accordion } from "./hooks/accordion";
import { AccordionRoot } from "./hooks/accordion_root";
import { CheckboxRoot } from "./hooks/checkbox_root";
import { SwitchRoot } from "./hooks/switch_root";
import { CollapsibleRoot } from "./hooks/collapsible_root";
import { Tabs } from "./hooks/tabs";
import { TabsRoot } from "./hooks/tabs_root";
import { RadioCards } from "./hooks/radio_cards";
import { CheckboxGroupRoot } from "./hooks/checkbox_group_root";
import { ContextMenuRoot } from "./hooks/context_menu_root";
import { DropdownMenu } from "./hooks/dropdown_menu";
import { DropdownMenuRoot } from "./hooks/dropdown_menu_root";
import { MenubarRoot } from "./hooks/menubar_root";
import { NavigationMenuRoot } from "./hooks/navigation_menu_root";
import { TooltipRoot } from "./hooks/tooltip_root";
import { HoverCard } from "./hooks/hover_card";
import { HoverCardRoot } from "./hooks/hover_card_root";
import { Popover } from "./hooks/popover";
import { PopoverRoot } from "./hooks/popover_root";
import { ScrollAreaRoot } from "./hooks/scroll_area_root";
import { SelectRoot } from "./hooks/select_root";
import { RadioGroupRoot } from "./hooks/radio_group_root";
import { AvatarRoot } from "./hooks/avatar_root";
import { ToggleRoot } from "./hooks/toggle_root";
import { ToggleGroupRoot } from "./hooks/toggle_group_root";
import { LabelRoot } from "./hooks/label_root";
import { ToastRoot } from "./hooks/toast_root";
import { ToastViewport } from "./hooks/toast_viewport";
import { SliderRoot } from "./hooks/slider_root";
import { ToolbarRoot } from "./hooks/toolbar_root";
import { FormRoot } from "./hooks/form_root";
import { PasswordToggleFieldRoot } from "./hooks/password_toggle_field_root";
import { OneTimePasswordFieldRoot } from "./hooks/one_time_password_field_root";

export const hooks = {
  Dialog,
  DialogRoot,
  AlertDialogRoot,
  Accordion,
  AccordionRoot,
  CheckboxRoot,
  SwitchRoot,
  CollapsibleRoot,
  Tabs,
  TabsRoot,
  RadioCards,
  CheckboxGroupRoot,
  ContextMenuRoot,
  DropdownMenu,
  DropdownMenuRoot,
  MenubarRoot,
  NavigationMenuRoot,
  TooltipRoot,
  HoverCard,
  HoverCardRoot,
  Popover,
  PopoverRoot,
  ScrollAreaRoot,
  SelectRoot,
  RadioGroupRoot,
  AvatarRoot,
  ToggleRoot,
  ToggleGroupRoot,
  LabelRoot,
  ToastRoot,
  ToastViewport,
  SliderRoot,
  ToolbarRoot,
  FormRoot,
  PasswordToggleFieldRoot,
  OneTimePasswordFieldRoot,
};
