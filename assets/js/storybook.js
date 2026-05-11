// Import hooks for Essence UI components
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import { Dialog } from "./hooks/dialog";
import { Accordion } from "./hooks/accordion";
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

// Initialize LiveSocket if we are not inside Storybook iframe (which handles its own socket)
// Or always if we want standalone views to work.
if (!window.storybook_socket_initialized) {
    let csrfToken = document.querySelector("meta[name='csrf-token']")?.getAttribute("content");
    if (csrfToken) {
        let liveSocket = new LiveSocket("/live", Socket, {
            params: { _csrf_token: csrfToken },
            hooks: hooks
        });
        liveSocket.connect();
        window.liveSocket = liveSocket;
        window.storybook_socket_initialized = true;
    }
}

// Storybook integration (legacy)
(function() {
  window.storybook = {
    Hooks: hooks
  };
})();
