import { defineConfig } from "@playwright/test";

export default defineConfig({
  testDir: "./test",
  use: {
    baseURL: "http://localhost:4000",
  },
  webServer: {
    url: "http://localhost:4000",
    reuseExistingServer: !process.env.CI,
  },
});
