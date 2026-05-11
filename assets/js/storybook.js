// Import hooks for Essence UI components
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import { Dialog } from "./hooks/dialog";
import { Accordion } from "./hooks/accordion";
import { AccordionRoot } from "./hooks/accordion_root";
import { Tabs } from "./hooks/tabs";
import { CheckboxCards } from "./hooks/checkbox_cards";
import { RadioCards } from "./hooks/radio_cards";
import { ContextMenu } from "./hooks/context_menu";
import { DropdownMenu } from "./hooks/dropdown_menu";
import { Tooltip } from "./hooks/tooltip";
import { HoverCard } from "./hooks/hover_card";
import { Popover } from "./hooks/popover";
import { ScrollArea } from "./hooks/scroll_area";

let hooks = {
  Dialog,
  Accordion,
  AccordionRoot,
  Tabs,
  CheckboxCards,
  RadioCards,
  ContextMenu,
  DropdownMenu,
  Tooltip,
  HoverCard,
  Popover,
  ScrollArea
};

// Storybook integration
(function() {
  window.storybook = {
    Hooks: hooks
  };
})();
