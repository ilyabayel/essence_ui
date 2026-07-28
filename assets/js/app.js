// Import hooks for Essence UI components
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import { hooks as essenceHooks } from "./essence_ui";
import { DocsSidebar } from "./docs/docs_sidebar";
import {
  AppearanceToggle,
  CopyCode,
  Clipboard,
  bootAppearance,
} from "./docs/site";

bootAppearance();

let hooks = {
  ...essenceHooks,
  DocsSidebar,
  AppearanceToggle,
  CopyCode,
  Clipboard,
};

const csrfToken = document
  .querySelector("meta[name='csrf-token']")
  ?.getAttribute("content");

if (csrfToken) {
  const liveSocket = new LiveSocket("/live", Socket, {
    hooks,
    params: { _csrf_token: csrfToken },
  });
  liveSocket.connect();
  window.liveSocket = liveSocket;
}
