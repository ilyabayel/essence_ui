// Import hooks for Essence UI components
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import { Dialog } from "./hooks/dialog";
import { DialogRoot, AlertDialogRoot } from "./hooks/dialog_root";
import { Accordion } from "./hooks/accordion";
import { AccordionRoot } from "./hooks/accordion_root";
import { CheckboxRoot } from "./hooks/checkbox_root";
import { SwitchRoot } from "./hooks/switch_root";
import { CollapsibleRoot } from "./hooks/collapsible_root";
import { Tabs } from "./hooks/tabs";
import { CheckboxCards } from "./hooks/checkbox_cards";
import { RadioCards } from "./hooks/radio_cards";
import { ContextMenu } from "./hooks/context_menu";
import { DropdownMenu } from "./hooks/dropdown_menu";
import { Tooltip } from "./hooks/tooltip";
import { TooltipRoot } from "./hooks/tooltip_root";
import { HoverCard } from "./hooks/hover_card";
import { HoverCardRoot } from "./hooks/hover_card_root";
import { Popover } from "./hooks/popover";
import { PopoverRoot } from "./hooks/popover_root";
import { ScrollArea } from "./hooks/scroll_area";
import { SelectRoot } from "./hooks/select_root";
import { RadioGroupRoot } from "./hooks/radio_group_root";
import { AvatarRoot } from "./hooks/avatar_root";
import { ToggleRoot } from "./hooks/toggle_root";
import { ToggleGroupRoot } from "./hooks/toggle_group_root";
import { LabelRoot } from "./hooks/label_root";
import { ToastRoot } from "./hooks/toast_root";
import { ToastViewport } from "./hooks/toast_viewport";

let hooks = {
  Dialog,
  DialogRoot,
  AlertDialogRoot,
  Accordion,
  AccordionRoot,
  CheckboxRoot,
  SwitchRoot,
  CollapsibleRoot,
  Tabs,
  CheckboxCards,
  RadioCards,
  ContextMenu,
  DropdownMenu,
  Tooltip,
  TooltipRoot,
  HoverCard,
  HoverCardRoot,
  Popover,
  PopoverRoot,
  ScrollArea,
  SelectRoot,
  RadioGroupRoot,
  AvatarRoot,
  ToggleRoot,
  ToggleGroupRoot,
  LabelRoot,
  ToastRoot,
  ToastViewport
};

// Storybook integration
(function() {
  window.storybook = {
    Hooks: hooks
  };
})();
