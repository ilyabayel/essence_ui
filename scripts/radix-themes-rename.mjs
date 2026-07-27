#!/usr/bin/env node
/**
 * Themes rename: est- → rt-, essence-ui → radix-themes, strip es-DialogRoot.
 * Usage: node scripts/radix-themes-rename.mjs [--write]
 */
import { readFileSync, writeFileSync, readdirSync, statSync } from "node:fs";
import { join, relative, resolve, dirname, extname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = resolve(__dirname, "..");
const write = process.argv.includes("--write");

const EXTS = new Set([
  ".ex",
  ".exs",
  ".heex",
  ".js",
  ".mjs",
  ".css",
  ".md",
  ".mdx",
  ".json",
  ".story.exs",
]);

const SKIP_DIRS = new Set([
  "node_modules",
  "_build",
  "deps",
  ".git",
  ".radix-ui",
  "priv",
  "assets/radix", // already upstream
  "assets/css/primitives", // demo chrome — no est- Themes classes expected, but skip accidental
]);

const ROOTS = [
  "lib",
  "test",
  "storybook",
  "docs",
  "assets/js",
  "assets/css",
  "assets/test",
  ".cursor/skills",
];

function shouldSkip(path) {
  const rel = relative(root, path);
  for (const skip of SKIP_DIRS) {
    if (rel === skip || rel.startsWith(skip + "/")) return true;
  }
  // Don't touch vendored radix source
  if (rel.startsWith("assets/radix/")) return true;
  return false;
}

function walk(dir, acc = []) {
  if (!statSync(dir, { throwIfNoEntry: false })) return acc;
  for (const name of readdirSync(dir)) {
    const path = join(dir, name);
    if (shouldSkip(path)) continue;
    const st = statSync(path);
    if (st.isDirectory()) walk(path, acc);
    else {
      const ext = extname(name);
      // .story.exs handled via .exs
      if (EXTS.has(ext) || name.endsWith(".story.exs")) acc.push(path);
    }
  }
  return acc;
}

function transform(content) {
  let out = content;
  // Order matters: longer / more specific first
  out = out.replace(/\bes-DialogRoot\b/g, "");
  // Theme root class only — do not rewrite package import paths (essence_ui/…)
  out = out.replace(/\.essence-ui\b/g, ".radix-themes");
  out = out.replace(/(["'`\s])essence-ui\b/g, "$1radix-themes");
  // est- prefix for classes (est-Button, est-r-size-2, est-variant-soft, etc.)
  out = out.replace(/\best-/g, "rt-");
  // Clean doubled spaces from stripped class
  out = out.replace(/class="([^"]*)"/g, (_m, classes) => {
    const cleaned = classes.replace(/\s+/g, " ").trim();
    return `class="${cleaned}"`;
  });
  return out;
}

const files = ROOTS.flatMap((r) => walk(join(root, r)));
let changed = 0;
const report = [];

for (const file of files) {
  const before = readFileSync(file, "utf8");
  // Skip primitive demo CSS that shouldn't have Themes renames applied wrongly —
  // but est- only appears in Themes CSS/code; safe to transform everywhere in ROOTS
  // except we skipped assets/css/primitives
  if (file.includes("/assets/css/primitives/")) continue;
  if (file.includes("/assets/radix/")) continue;

  const after = transform(before);
  if (after !== before) {
    changed++;
    report.push(relative(root, file));
    if (write) writeFileSync(file, after);
  }
}

console.log(`${write ? "Updated" : "Would update"} ${changed} files`);
for (const f of report.slice(0, 40)) console.log(`  ${f}`);
if (report.length > 40) console.log(`  … +${report.length - 40} more`);
if (!write) console.log("Dry-run. Pass --write to apply.");
