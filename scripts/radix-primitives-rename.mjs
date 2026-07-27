#!/usr/bin/env node
/**
 * Primitives rename: data-essence- → data-radix-, --essence- → --radix-
 * Does NOT rename essence-demo docs chrome.
 * Usage: node scripts/radix-primitives-rename.mjs [--write]
 */
import { readFileSync, writeFileSync, readdirSync, statSync } from "node:fs";
import { join, relative, resolve, dirname, extname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = resolve(__dirname, "..");
const write = process.argv.includes("--write");

const EXTS = new Set([".ex", ".exs", ".heex", ".js", ".mjs", ".css", ".md", ".mdx"]);

const SKIP_DIRS = new Set([
  "node_modules",
  "_build",
  "deps",
  ".git",
  ".radix-ui",
  "priv",
  "assets/radix",
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
  return false;
}

function walk(dir, acc = []) {
  if (!statSync(dir, { throwIfNoEntry: false })) return acc;
  for (const name of readdirSync(dir)) {
    const path = join(dir, name);
    if (shouldSkip(path)) continue;
    const st = statSync(path);
    if (st.isDirectory()) walk(path, acc);
    else if (EXTS.has(extname(name)) || name.endsWith(".story.exs")) acc.push(path);
  }
  return acc;
}

function transform(content) {
  let out = content;
  out = out.replace(/data-essence-/g, "data-radix-");
  out = out.replace(/--essence-/g, "--radix-");
  // Attribute atom / string forms in Elixir: :"data-essence-..." already covered by data-essence-
  // QuerySelector strings with [data-essence-...] covered
  return out;
}

const files = ROOTS.flatMap((r) => walk(join(root, r)));
let changed = 0;
const report = [];

for (const file of files) {
  const before = readFileSync(file, "utf8");
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
