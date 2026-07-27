#!/usr/bin/env node
/**
 * Fail if Themes/Primitives surfaces still use Essence-renamed identifiers.
 * Usage: node scripts/check-radix-compat.mjs
 */
import { readFileSync, readdirSync, statSync } from "node:fs";
import { join, relative, resolve, dirname, extname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = resolve(__dirname, "..");

const EXTS = new Set([".ex", ".exs", ".heex", ".js", ".mjs", ".css", ".md"]);
const SKIP_DIRS = new Set([
  "node_modules",
  "_build",
  "deps",
  ".git",
  ".radix-ui",
  "priv",
  "scripts", // this file mentions forbidden strings
]);

const ROOTS = ["lib", "test", "docs", "assets/js", "assets/css", "assets/test", ".cursor/skills"];

function shouldSkip(path) {
  const rel = relative(root, path);
  for (const skip of SKIP_DIRS) {
    if (rel === skip || rel.startsWith(skip + "/")) return true;
  }
  // Docs chrome / demo may still say "essence" in prose — still check data-essence
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

const patterns = [
  { name: "est- class prefix", re: /\best-/ },
  { name: "essence-ui theme root", re: /essence-ui/ },
  { name: "es-DialogRoot", re: /\bes-DialogRoot\b/ },
  { name: "data-essence-", re: /data-essence-/ },
  { name: "--essence- CSS var", re: /--essence-/ },
];

const files = ROOTS.flatMap((r) => walk(join(root, r)));
const hits = [];

for (const file of files) {
  // Skip overlays/docs prose carefully? Plan says fail if any remain on Themes+Primitives surfaces.
  // Allow "essence-demo" and package name mentions — those don't match our patterns.
  const text = readFileSync(file, "utf8");
  for (const { name, re } of patterns) {
    if (re.test(text)) {
      const lines = text.split("\n");
      lines.forEach((line, i) => {
        if (re.test(line)) hits.push(`${relative(root, file)}:${i + 1}: [${name}] ${line.trim().slice(0, 120)}`);
      });
    }
  }
}

if (hits.length) {
  console.error(`Radix compat check FAILED (${hits.length} hits):\n`);
  for (const h of hits.slice(0, 80)) console.error(`  ${h}`);
  if (hits.length > 80) console.error(`  … +${hits.length - 80} more`);
  process.exit(1);
}

console.log("Radix compat check OK");
