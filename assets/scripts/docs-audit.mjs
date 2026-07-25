import { chromium } from "@playwright/test";
import AxeBuilder from "@axe-core/playwright";
import fs from "node:fs";
import path from "node:path";

const outDir = "/opt/cursor/artifacts/docs-screenshots";
const base = "http://127.0.0.1:4000";
fs.mkdirSync(outDir, { recursive: true });

const pages = [
  { name: "getting-started", path: "/" },
  { name: "button", path: "/components/button" },
  { name: "dialog", path: "/primitives/dialog" },
];

const viewports = [
  { name: "phone-sm", width: 320, height: 568 },
  { name: "phone", width: 390, height: 844 },
  { name: "tablet", width: 768, height: 1024 },
  { name: "laptop", width: 1024, height: 768 },
  { name: "laptop-md", width: 1280, height: 800 },
  { name: "laptop-lg", width: 1440, height: 900 },
  { name: "desktop", width: 1920, height: 1080 },
];

const browser = await chromium.launch();
const report = { layouts: [], a11y: [] };

for (const vp of viewports) {
  const context = await browser.newContext({
    viewport: { width: vp.width, height: vp.height },
    deviceScaleFactor: vp.width < 900 ? 2 : 1,
  });
  const page = await context.newPage();

  for (const p of pages) {
    await page.goto(`${base}${p.path}`, { waitUntil: "networkidle" });
    await page.waitForTimeout(250);

    const metrics = await page.evaluate(() => {
      const shell = document.querySelector(".docs-shell");
      const topbar = document.querySelector(".docs-topbar");
      const sidebar = document.querySelector("#docs-sidebar");
      const main = document.querySelector(".docs-main");
      const propsMobile = document.querySelector(".docs-props__mobile");
      const propsDesktop = document.querySelector(".docs-props__desktop");
      const cs = getComputedStyle;
      const visible = (el) => {
        if (!el) return false;
        const s = cs(el);
        if (s.display === "none" || s.visibility === "hidden") return false;
        const r = el.getBoundingClientRect();
        return r.width > 0 && r.height > 0;
      };
      const sidebarBox = sidebar?.getBoundingClientRect();
      return {
        vw: innerWidth,
        bodyScrollW: document.documentElement.scrollWidth,
        hasHScroll: document.documentElement.scrollWidth > innerWidth + 1,
        topbarVisible: visible(topbar),
        sidebarVisible: visible(sidebar) && (sidebarBox?.left ?? -1) >= -1 && (sidebarBox?.right ?? 0) > 20,
        sidebarTransform: sidebar ? cs(sidebar).transform : null,
        sidebarPos: sidebar ? cs(sidebar).position : null,
        shellAreas: shell ? cs(shell).gridTemplateAreas : null,
        shellCols: shell ? cs(shell).gridTemplateColumns : null,
        mainPad: main ? cs(main).padding : null,
        propsMobile: propsMobile ? cs(propsMobile).display : null,
        propsDesktop: propsDesktop ? cs(propsDesktop).display : null,
      };
    });

    const file = path.join(outDir, `${p.name}-${vp.name}-fold.png`);
    await page.screenshot({ path: file, fullPage: false });

    report.layouts.push({ page: p.name, viewport: vp.name, ...vp, ...metrics, shot: file });
    console.log(`[layout] ${p.name} @ ${vp.name}`, JSON.stringify(metrics));
  }

  // a11y on first page of this viewport (getting started) + button + dialog once at phone and laptop
  if (["phone", "laptop", "laptop-md"].includes(vp.name)) {
    for (const p of pages) {
      await page.goto(`${base}${p.path}`, { waitUntil: "networkidle" });
      const results = await new AxeBuilder({ page })
        .withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "best-practice"])
        .analyze();
      const violations = results.violations.map((v) => ({
        id: v.id,
        impact: v.impact,
        description: v.description,
        help: v.help,
        nodes: v.nodes.slice(0, 5).map((n) => ({
          target: n.target,
          html: n.html?.slice(0, 180),
          failureSummary: n.failureSummary?.slice(0, 300),
        })),
      }));
      report.a11y.push({ page: p.name, viewport: vp.name, count: violations.length, violations });
      console.log(`[a11y] ${p.name} @ ${vp.name}: ${violations.length} violations`);
      for (const v of violations) {
        console.log(`  - ${v.impact} ${v.id}: ${v.help}`);
        for (const n of v.nodes) console.log(`      ${JSON.stringify(n.target)} ${n.failureSummary?.split("\n")[0]}`);
      }
    }
  }

  await context.close();
}

// Extra: open nav on phone and axe that state
{
  const context = await browser.newContext({ viewport: { width: 390, height: 844 }, deviceScaleFactor: 2 });
  const page = await context.newPage();
  await page.goto(`${base}/`, { waitUntil: "networkidle" });
  await page.getByRole("button", { name: /menu/i }).click();
  await page.waitForTimeout(300);
  await page.screenshot({ path: path.join(outDir, "getting-started-phone-nav-open.png"), fullPage: false });
  const results = await new AxeBuilder({ page })
    .withTags(["wcag2a", "wcag2aa", "wcag21a", "wcag21aa", "best-practice"])
    .analyze();
  const violations = results.violations.map((v) => ({
    id: v.id,
    impact: v.impact,
    help: v.help,
    nodes: v.nodes.slice(0, 5).map((n) => ({ target: n.target, failureSummary: n.failureSummary?.slice(0, 300) })),
  }));
  report.a11y.push({ page: "getting-started", viewport: "phone-nav-open", count: violations.length, violations });
  console.log(`[a11y] nav-open: ${violations.length} violations`);
  for (const v of violations) {
    console.log(`  - ${v.impact} ${v.id}: ${v.help}`);
  }
  await context.close();
}

fs.writeFileSync(path.join(outDir, "audit-report.json"), JSON.stringify(report, null, 2));
console.log("wrote audit-report.json");
await browser.close();
