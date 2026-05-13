import { defineConfig } from "@playwright/test";

export default defineConfig({
  testDir: "./test",
  use: {
    baseURL: "http://127.0.0.1:4000",
  },
  webServer: {
    command: "mix phx.server",
    url: "http://127.0.0.1:4000",
    reuseExistingServer: !process.env.CI,
  },
});
