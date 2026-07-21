# Essence UI

Essence UI is a UI components library for Phoenix LiveView.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.


<!-- headroom:rtk-instructions -->
# RTK (Rust Token Killer) - Token-Optimized Commands

When running shell commands, **always prefix with `rtk`**. This reduces context
usage by 60-90% with zero behavior change. If rtk has no filter for a command,
it passes through unchanged — so it is always safe to use.

## Key Commands
```bash
# Git (59-80% savings)
rtk git status          rtk git diff            rtk git log

# Files & Search (60-75% savings)
rtk ls <path>           rtk read <file>         rtk grep <pattern>
rtk find <pattern>      rtk diff <file>

# Test (90-99% savings) — shows failures only
rtk pytest tests/       rtk cargo test          rtk test <cmd>

# Build & Lint (80-90% savings) — shows errors only
rtk tsc                 rtk lint                rtk cargo build
rtk prettier --check    rtk mypy                rtk ruff check

# Analysis (70-90% savings)
rtk err <cmd>           rtk log <file>          rtk json <file>
rtk summary <cmd>       rtk deps                rtk env

# GitHub (26-87% savings)
rtk gh pr view <n>      rtk gh run list         rtk gh issue list

# Infrastructure (85% savings)
rtk docker ps           rtk kubectl get         rtk docker logs <c>

# Package managers (70-90% savings)
rtk pip list            rtk pnpm install        rtk npm run <script>
```

## Rules
- In command chains, prefix each segment: `rtk git add . && rtk git commit -m "msg"`
- For debugging, use raw command without rtk prefix
- `rtk proxy <cmd>` runs command without filtering but tracks usage
<!-- /headroom:rtk-instructions -->

## Cursor Cloud specific instructions

Single Phoenix (Elixir) app: a UI component library showcased via Phoenix Storybook, plus a CRM demo. No database or external services. Erlang/OTP + Elixir and `inotify-tools` are baked into the VM image; the startup update script only refreshes deps (`npm --prefix assets ci` then `mix setup`).

- Dev server: `mix phx.server` (Bandit on `127.0.0.1:4000`). Storybook is at `/` (redirects to `/getting_started`); CRM demo at `/crm`; LiveDashboard at `/dev/dashboard`.
- Standard commands are in `README.md` and the `mix.exs` `setup` alias. Note `mix setup` does NOT run `npm install`; the `assets/` npm deps (postcss) must be installed first (`npm --prefix assets ci`), otherwise `build:css` fails with `postcss: not found`.
- CSS is not wired into Phoenix watchers. After editing `assets/css/*`, rebuild with `npm --prefix assets run build:css` (or run `npm --prefix assets run watch:css` in a second terminal). JS is auto-bundled by the esbuild watcher.
- Tests: `mix test` (no server needed). A pre-existing failure `EssenceUI.Primitives.Slot.slot/1 is undefined` exists on a clean checkout (the module lives at `lib/essence_ui/utilities/slot.ex`, not under `Primitives`); unrelated to environment setup.
- Browser E2E (Playwright): from repo root run `npm --prefix assets ci && npx --prefix assets playwright install chromium`, then `npm --prefix assets run test:e2e`. Specs live in `assets/test/`; shared helpers in `assets/test/helpers/` (`gotoPrimitive`, `expectNoA11yViolations`). Playwright auto-starts `mix phx.server` on `127.0.0.1:4000`.
- Lint: `mix credo` and `mix format --check-formatted` both run (they report pre-existing findings).
