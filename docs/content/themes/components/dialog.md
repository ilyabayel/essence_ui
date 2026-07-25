---
title: Dialog
description: Modal dialog with Themes styling.
---

Themes Dialog portals content and applies Themes tokens. Prefer the headless [Primitives Dialog](/primitives/docs/components/dialog) when you need full part composition.

## Example

Open a dialog by targeting a portal mount point. The Themes wrapper currently requires a `target` selector and renders content through a portal — see API friction notes if this feels awkward compared to Radix Themes.

<.demo heex={~s[<.button phx-click={Phoenix.LiveView.JS.dispatch("open", to: "#themes-docs-dialog")}>Open</.button>]}>
  <.flex gap="3" align="center">
    <.text size="2" color="gray">Use Primitives Dialog for the full part API, or CRM for a Themes AlertDialog example.</.text>
    <.button as="a" href="/crm" variant="soft">Open CRM demo</.button>
  </.flex>
</.demo>

## Related

- [Primitives Dialog](/primitives/docs/components/dialog)
- [Recruiting CRM](/themes/docs/examples/crm) uses `AlertDialog` for candidate detail

## API Reference

<.props_table module={EssenceUI.Components.Dialog} function={:dialog} />
