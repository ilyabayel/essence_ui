---
title: Collapsible
description: An interactive component which expands/collapses a panel.
aria: https://www.w3.org/WAI/ARIA/apg/patterns/disclosure
---

An interactive component which expands/collapses a panel.

<.demo variant="primitive" component="collapsible" css={primitive_css("collapsible")}>

  <:heex>
    <Collapsible.root
              id="collapsible-primitive"
              class="CollapsibleRoot"
            >
              <div style="display: flex; align-items: center; justify-content: space-between;">
                <span
                  class="Text"
                  style="color: white;"
                >
                  @peduarte starred 3 repositories
                </span>
                <Collapsible.trigger
                  id="collapsible-trigger"
                  content_id="collapsible-content"
                  class="IconButton"
                  aria-label="Toggle"
                >
                  <svg
                    width="15"
                    height="15"
                    viewBox="0 0 15 15"
                    fill="none"
                    aria-hidden="true"
                  >
                    <path
                      d="M3.5 5.5h8M3.5 9.5h8"
                      stroke="currentColor"
                      stroke-width="1.5"
                      stroke-linecap="round"
                    />
                  </svg>
                </Collapsible.trigger>
              </div>

              <div class="Repository">
                <span class="Text">@radix-ui/primitives</span>
              </div>

              <Collapsible.content id="collapsible-content">
                <div class="Repository">
                  <span class="Text">@radix-ui/colors</span>
                </div>
                <div class="Repository">
                  <span class="Text">@radix-ui/themes</span>
                </div>
              </Collapsible.content>
            </Collapsible.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Full keyboard navigation.</:item>
  <:item>Can be controlled or uncontrolled.</:item>
</.highlights>

## Anatomy

```heex
<Collapsible.root>
  <Collapsible.trigger />
  <Collapsible.content />
</Collapsible.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Content">The `content` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Collapsible} function={:root} />

### Trigger

<.props_table module={EssenceUI.Primitives.Collapsible} function={:trigger} />

### Content

<.props_table module={EssenceUI.Primitives.Collapsible} function={:content} />

## Examples

See the live demo above and `storybook/primitives/collapsible.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/WAI/ARIA/apg/patterns/disclosure).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
