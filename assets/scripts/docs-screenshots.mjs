import { chromium } from "@playwright/test";
import fs from "node:fs";
import path from "node:path";

const outDir = "/opt/cursor/artifacts/docs-screenshots";
const base = "http://127.0.0.1:4000";
fs.mkdirSync(outDir, { recursive: true });

const browser = await chromium.launch();

async function shot(page, name, fullPage = false) {
  const file = path.join(outDir, `${name}.png`);
  await page.screenshot({ path: file, fullPage });
  console.log("wrote", file);
}

async function mobilePass() {
  const context = await browser.newContext({
    viewport: { width: 390, height: 844 },
    deviceScaleFactor: 2,
  });
  const page = await context.newPage();

  await page.goto(`${base}/`, { waitUntil: "networkidle" });
  await page.waitForTimeout(300);
  await shot(page, "getting-started-mobile-fold");
  await shot(page, "getting-started-mobile", true);

  await page.getByRole("button", { name: "Menu" }).click();
  await page.waitForTimeout(300);
  await shot(page, "getting-started-mobile-nav-open");
  await page.locator(".docs-sidebar__mobile-header button").click();
  await page.waitForTimeout(200);

  await page.goto(`${base}/components/button`, { waitUntil: "networkidle" });
  await page.waitForTimeout(300);
  await shot(page, "button-mobile-fold");
  await shot(page, "button-mobile", true);

  const variants = page.locator(".docs-demo").nth(1);
  await variants.scrollIntoViewIfNeeded();
  await page.waitForTimeout(200);
  await shot(page, "button-mobile-demo");

  const code = variants.locator(".docs-code-block");
  await code.evaluate((el) => {
    el.scrollLeft = Math.max(0, el.scrollWidth - el.clientWidth);
  });
  await page.waitForTimeout(150);
  await shot(page, "button-mobile-code-scrolled");

  await page.locator(".docs-props").scrollIntoViewIfNeeded();
  await page.waitForTimeout(200);
  await shot(page, "button-mobile-props");

  await page.goto(`${base}/primitives/dialog`, { waitUntil: "networkidle" });
  await page.waitForTimeout(300);
  await shot(page, "dialog-mobile-fold");
  await shot(page, "dialog-mobile", true);
  await page.locator(".docs-anatomy").scrollIntoViewIfNeeded();
  await page.waitForTimeout(150);
  await shot(page, "dialog-mobile-anatomy");
  await page.locator(".docs-demo").first().scrollIntoViewIfNeeded();
  await page.waitForTimeout(150);
  await shot(page, "dialog-mobile-demo");

  await context.close();
}

async function narrowPass() {
  const context = await browser.newContext({
    viewport: { width: 320, height: 568 },
    deviceScaleFactor: 2,
  });
  const page = await context.newPage();
  await page.goto(`${base}/components/button`, { waitUntil: "networkidle" });
  await page.waitForTimeout(300);
  await shot(page, "button-narrow-fold");
  await page.getByRole("button", { name: "Menu" }).click();
  await page.waitForTimeout(250);
  await shot(page, "button-narrow-nav-open");
  await context.close();
}

async function sizedPass(name, width, height, dpr = 1) {
  const context = await browser.newContext({
    viewport: { width, height },
    deviceScaleFactor: dpr,
  });
  const page = await context.newPage();
  for (const [label, path_] of [
    [`getting-started-${name}`, "/"],
    [`button-${name}`, "/components/button"],
    [`dialog-${name}`, "/primitives/dialog"],
  ]) {
    await page.goto(`${base}${path_}`, { waitUntil: "networkidle" });
    await page.waitForTimeout(300);
    await shot(page, `${label}-fold`);
    await shot(page, label, true);
  }
  await context.close();
}

await mobilePass();
await narrowPass();
await sizedPass("tablet", 768, 1024);
await sizedPass("desktop", 1280, 800);

// Verify layout metrics
const context = await browser.newContext({
  viewport: { width: 390, height: 844 },
  deviceScaleFactor: 2,
});
const page = await context.newPage();
await page.goto(`${base}/`, { waitUntil: "networkidle" });
const metrics = await page.evaluate(() => {
  const topbar = document.querySelector(".docs-topbar");
  const menu = [...topbar.querySelectorAll("button")].find((b) => /menu/i.test(b.textContent));
  const brand = topbar.children[0];
  const codes = [...document.querySelectorAll(".docs-code-block")];
  return {
    bodyMargin: getComputedStyle(document.body).margin,
    topbarLeft: topbar.getBoundingClientRect().x,
    topbarJustify: getComputedStyle(topbar).justifyContent,
    brandRight: brand.getBoundingClientRect().right,
    menuLeft: menu.getBoundingClientRect().left,
    menuRight: menu.getBoundingClientRect().right,
    viewportW: innerWidth,
    shortCodeOverflow: codes.map((el) => ({
      overflow: el.scrollWidth > el.clientWidth + 1,
      text: el.textContent.trim().slice(0, 40),
      client: el.clientWidth,
      scroll: el.scrollWidth,
    })),
  };
});
console.log("METRICS", JSON.stringify(metrics, null, 2));

await page.getByRole("button", { name: "Menu" }).click();
await page.waitForTimeout(250);
const nav = await page.evaluate(() => {
  const header = document.querySelector(".docs-sidebar__mobile-header");
  const kids = [...header.children].map((el) => ({
    text: el.textContent.trim(),
    left: el.getBoundingClientRect().left,
    right: el.getBoundingClientRect().right,
  }));
  return {
    justify: getComputedStyle(header).justifyContent,
    kids,
    headerWidth: header.getBoundingClientRect().width,
  };
});
console.log("NAV", JSON.stringify(nav, null, 2));
await context.close();

await browser.close();
console.log("done");
