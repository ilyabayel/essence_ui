#!/usr/bin/env node
/**
 * Build a single consumer stylesheet: Radix Themes + Essence overlays.
 *
 * Usage:
 *   node scripts/build-css-release.mjs
 *
 * Output: priv/static/essence-ui.css
 */
import { readFile, writeFile, mkdir, rm } from "node:fs/promises";
import { createRequire } from "node:module";
import { dirname, resolve, join } from "node:path";
import { fileURLToPath, pathToFileURL } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const root = resolve(__dirname, "..");
const assets = resolve(root, "assets");
const outFile = resolve(root, "priv/static/essence-ui.css");
const legacyOutDir = resolve(root, "priv/static/essence_ui");

const require = createRequire(join(assets, "package.json"));
const postcss = require("postcss");
const postcssConfig = (await import(pathToFileURL(join(assets, "postcss.config.js")).href)).default;
const processor = postcss(postcssConfig.plugins);

process.chdir(assets);

const input = "essence.css";
const inputPath = resolve(assets, input);
const css = await readFile(inputPath, "utf-8");
const result = await processor.process(css, { from: inputPath, to: outFile });

await mkdir(dirname(outFile), { recursive: true });
await writeFile(outFile, result.css);

// Remove previous multi-file release layout if present
await rm(legacyOutDir, { recursive: true, force: true });

console.log(`Built ${input} → priv/static/essence-ui.css (${result.css.length} bytes)`);
