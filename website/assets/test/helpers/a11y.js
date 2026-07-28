import AxeBuilder from "@axe-core/playwright";
import { expect } from "@playwright/test";

/**
 * Run axe on the current page and assert no violations.
 * @param {import('@playwright/test').Page} page
 * @param {{ include?: string | string[], exclude?: string | string[] }} [options]
 */
export async function expectNoA11yViolations(page, options = {}) {
  let builder = new AxeBuilder({ page }).withTags([
    "wcag2a",
    "wcag2aa",
    "wcag21a",
    "wcag21aa",
  ]);

  if (options.include) {
    const include = Array.isArray(options.include)
      ? options.include
      : [options.include];
    for (const selector of include) {
      builder = builder.include(selector);
    }
  }

  if (options.exclude) {
    const exclude = Array.isArray(options.exclude)
      ? options.exclude
      : [options.exclude];
    for (const selector of exclude) {
      builder = builder.exclude(selector);
    }
  }

  const results = await builder.analyze();
  expect(results.violations, formatViolations(results.violations)).toEqual([]);
}

function formatViolations(violations) {
  if (!violations?.length) return "no axe violations";
  return violations
    .map((v) => {
      const nodes = v.nodes
        .map((n) => `  - ${n.target.join(", ")}: ${n.failureSummary}`)
        .join("\n");
      return `${v.id} (${v.impact}): ${v.help}\n${nodes}`;
    })
    .join("\n\n");
}
