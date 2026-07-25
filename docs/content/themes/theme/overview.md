---
title: Theme overview
description: Configure appearance, accent, gray, radius, and scaling.
---

The Theme component is the root of Essence UI styling. It sets CSS custom properties consumed by every Themes component.

## Theme component

<.demo heex={~s[<.theme accent_color="crimson" gray_color="mauve" radius="full" is_root={false} has_background={false}><.button>Crimson</.button></.theme>]}>
  <.theme accent_color="crimson" gray_color="mauve" radius="full" is_root={false} has_background={false}>
    <.button>Crimson</.button>
  </.theme>
</.demo>

## Appearance

Use `appearance` to force light or dark, or `inherit` to follow the document (site appearance toggle).

- `inherit` — follow `html.light-theme` / `html.dark-theme`
- `light` — force light tokens on this subtree
- `dark` — force dark tokens on this subtree

## Tokens

| Prop | Values |
|------|--------|
| `accent_color` | gray, gold, … sky (26 accents) |
| `gray_color` | auto, gray, mauve, slate, sage, olive, sand |
| `radius` | none, small, medium, large, full |
| `scaling` | 90%, 95%, 100%, 105%, 110% |
| `panel_background` | solid, translucent |

## ThemePanel

Use `<.theme_panel />` in development or playgrounds to tweak theme values live. See the [Playground](/themes/playground).

## API Reference

<.props_table module={EssenceUI.Components.Theme} function={:theme} />
