#!/usr/bin/env node
/**
 * Copy Radix Themes CSS source into assets/radix/ (CSS only + LICENSE).
 * Usage: node scripts/vendor-radix-themes-css.mjs [--write]
 * Default is dry-run.
 */
import { cpSync, existsSync, mkdirSync, readdirSync, rmSync, statSync, writeFileSync, readFileSync } from "node:fs";
import { dirname, join, relative, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = resolve(__dirname, "..");
const write = process.argv.includes("--write");

const srcRoot = resolve(root, ".radix-ui/themes/packages/radix-ui-themes/src");
const licenseSrc = resolve(root, ".radix-ui/themes/LICENSE");
const destRoot = resolve(root, "assets/radix");

function collectCss(dir, acc = []) {
  if (!existsSync(dir)) return acc;
  for (const name of readdirSync(dir)) {
    const path = join(dir, name);
    const st = statSync(path);
    if (st.isDirectory()) collectCss(path, acc);
    else if (name.endsWith(".css")) acc.push(path);
  }
  return acc;
}

if (!existsSync(srcRoot)) {
  console.error(`Missing Radix Themes source at ${srcRoot}`);
  console.error("Clone radix-ui/themes into .radix-ui/themes first.");
  process.exit(1);
}

const styles = collectCss(join(srcRoot, "styles"));
const components = collectCss(join(srcRoot, "components"));
const files = [...styles, ...components];

console.log(`Found ${styles.length} styles + ${components.length} component CSS files`);
console.log(`Destination: ${relative(root, destRoot)}`);

if (!write) {
  console.log("Dry-run. Pass --write to replace assets/radix/");
  process.exit(0);
}

if (existsSync(destRoot)) rmSync(destRoot, { recursive: true, force: true });
mkdirSync(destRoot, { recursive: true });

for (const file of files) {
  const rel = relative(srcRoot, file);
  const dest = join(destRoot, rel);
  mkdirSync(dirname(dest), { recursive: true });
  cpSync(file, dest);
}

if (existsSync(licenseSrc)) {
  cpSync(licenseSrc, join(destRoot, "LICENSE"));
} else {
  writeFileSync(
    join(destRoot, "LICENSE"),
    "MIT License — see https://github.com/radix-ui/themes/blob/main/LICENSE\n",
  );
}

// Sanity: ensure index entry exists
const index = join(destRoot, "styles/index.css");
if (!existsSync(index)) {
  console.error("Vendor failed: styles/index.css missing");
  process.exit(1);
}

console.log(`Wrote ${files.length} CSS files + LICENSE → assets/radix/`);
console.log(`Sample root class: ${readFileSync(join(destRoot, "styles/tokens/color.css"), "utf8").includes(".radix-themes") ? ".radix-themes OK" : "MISSING .radix-themes"}`);
