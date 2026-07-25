import { chromium } from "@playwright/test";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const outDir = "/opt/cursor/artifacts/docs-screenshots";
const base = "http://127.0.0.1:4000";

const pages = [
  { name: "getting-started", path: "/docs" },
  { name: "button", path: "/docs/components/button" },
  { name: "dialog", path: "/docs/primitives/dialog" },
];

const viewports = [
  { name: "mobile", width: 390, height: 844 },
  { name: "tablet", width: 768, height: 1024 },
  { name: "desktop", width: 1280, height: 800 },
];

const browser = await chromium.launch();

for (const vp of viewports) {
  const context = await browser.newContext({
    viewport: { width: vp.width, height: vp.height },
    deviceScaleFactor: 1,
  });
  const page = await context.newPage();

  for (const p of pages) {
    await page.goto(`${base}${p.path}`, { waitUntil: "networkidle" });
    await page.waitForTimeout(400);
    const file = path.join(outDir, `${p.name}-${vp.name}.png`);
    await page.screenshot({ path: file, fullPage: true });
    console.log("wrote", file);
  }

  await context.close();
}

await browser.close();
