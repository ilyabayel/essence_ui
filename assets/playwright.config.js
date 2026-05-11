import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './test',
  use: {
    baseURL: 'http://localhost:4001',
  },
  webServer: {
    command: 'mix phx.server',
    url: 'http://localhost:4001',
    reuseExistingServer: !process.env.CI,
  },
});
