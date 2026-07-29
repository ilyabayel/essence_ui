# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2026-07-28

### Added

- Hex package metadata, MIT license, and ExDoc configuration
- Consumer JS hooks entrypoint at `assets/js/essence_ui.js`
- Prebuilt Themes stylesheet at `priv/static/essence-ui.css`

### Changed

- Split docs/CRM Phoenix app into `website/` (`:essence_ui_web`) so the Hex package only depends on Phoenix/LiveView
- Widen / minimize Hex runtime deps: `phoenix_live_view`, `phoenix_html`, `jason` (Phoenix itself is transitive via LiveView)

## [0.2.1] - 2026-07-29

### Changed

- Widen / minimize Hex runtime deps: `phoenix_live_view`, `phoenix_html`, `jason` (Phoenix itself is transitive via LiveView)
