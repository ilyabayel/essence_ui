defmodule EssenceUIWeb.Storybook do
  @moduledoc false
  use PhoenixStorybook,
    otp_app: :essence_ui,
    content_path: Path.expand("../../storybook", __DIR__),
    # assets path are remote path, not local file-system paths
    css_path: "/assets/storybook-iframe.css",
    js_path: "/assets/js/storybook.js",
    sandbox_class: "radix-themes",
    color_mode: true,
    color_mode_sandbox_dark_class: "dark"
end
