---
title: Separator
description: Visually or semantically separates content.
aria: https://www.w3.org/TR/wai-aria-1.2/#separator
---

Visually or semantically separates content.

<.demo variant="primitive" component="separator" css={primitive_css("separator")}>

  <:heex>
    <div
              class="radix-demo"
              data-component="separator"
            >
              <div style="width: 100%; max-width: 300px; margin: 0 15px;">
                <div
                  class="Text"
                  style="font-weight: 500;"
                >
                  Radix Primitives
                </div>
                <div class="Text">An open-source UI component library.</div>
                <Separator.separator
                  class="SeparatorRoot"
                  style="margin: 15px 0;"
                />
                <div style="display: flex; height: 20px; align-items: center;">
                  <div class="Text">Blog</div>
                  <Separator.separator
                    class="SeparatorRoot"
                    decorative
                    orientation="vertical"
                    style="margin: 0 15px;"
                  />
                  <div class="Text">Docs</div>
                  <Separator.separator
                    class="SeparatorRoot"
                    decorative
                    orientation="vertical"
                    style="margin: 0 15px;"
                  />
                  <div class="Text">Source</div>
                </div>
              </div>
              <style>
                .SeparatorRoot {
                  background-color: var(--violet-6);
                }
                .SeparatorRoot[data-orientation="horizontal"] {
                  height: 1px;
                  width: 100%;
                }
                .SeparatorRoot[data-orientation="vertical"] {
                  height: 100%;
                  width: 1px;
                }

                .Text {
                  color: white;
                  font-size: 15px;
                  line-height: 20px;
                }
              </style>
            </div>
  </:heex>
</.demo>

<.highlights>
  <:item>Supports horizontal and vertical orientations.</:item>
</.highlights>

## Anatomy

```heex
<Separator.separator>
</Separator.separator>
```

<.anatomy>
  <:part name="Separator">The `separator` part.</:part>
</.anatomy>

## API Reference

### Separator

<.props_table module={EssenceUI.Primitives.Separator} function={:separator} />

## Examples

See the live demo above and `storybook/primitives/separator.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.

## Accessibility

Adheres to the [WAI-ARIA pattern](https://www.w3.org/TR/wai-aria-1.2/#separator).

<.keyboard_table>
  <:row keys="Tab">Moves focus among focusable elements.</:row>
  <:row keys="Space">Activates the focused control when applicable.</:row>
  <:row keys="Enter">Activates the focused control when applicable.</:row>
  <:row keys="Escape">Dismisses overlays when applicable.</:row>
</.keyboard_table>
