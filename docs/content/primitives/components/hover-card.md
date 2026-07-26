---
title: Hover Card
description: For sighted users to preview content available behind a link.
---

For sighted users to preview content available behind a link.

<.demo variant="primitive" component="hover-card" css={primitive_css("hover-card")}>

  <:heex>
    <HoverCard.root
              id="hover-card-primitive"
              open_delay={100}
              close_delay={100}
            >
              <HoverCard.trigger
                id="hover-card-trigger"
                content_id="hover-card-content"
              >
                <a
                  class="ImageTrigger"
                  href="https://twitter.com/radix_ui"
                  target="_blank"
                  rel="noreferrer noopener"
                >
                  <img
                    class="Image normal"
                    src="https://pbs.twimg.com/profile_images/1337055608613253126/r_eiMp2H_400x400.png"
                    alt="Radix UI"
                  />
                </a>
              </HoverCard.trigger>
              <HoverCard.content
                id="hover-card-content"
                class="HoverCardContent"
                side_offset={5}
              >
                <div style="display: flex; flex-direction: column; gap: 7px;">
                  <img
                    class="Image large"
                    src="https://pbs.twimg.com/profile_images/1337055608613253126/r_eiMp2H_400x400.png"
                    alt="Radix UI"
                  />
                  <div style="display: flex; flex-direction: column; gap: 15px;">
                    <div>
                      <div class="Text bold">Radix</div>
                      <div class="Text faded">@radix_ui</div>
                    </div>
                    <div class="Text">
                      Components, icons, colors, and templates for building high-quality, accessible UI. Free and open-source.
                    </div>
                    <div style="display: flex; gap: 15px;">
                      <div style="display: flex; gap: 5px;">
                        <div class="Text bold">0</div>
                        <div class="Text faded">Following</div>
                      </div>
                      <div style="display: flex; gap: 5px;">
                        <div class="Text bold">2,900</div>
                        <div class="Text faded">Followers</div>
                      </div>
                    </div>
                  </div>
                </div>
                <HoverCard.arrow class="HoverCardArrow" />
              </HoverCard.content>
            </HoverCard.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Can be controlled or uncontrolled.</:item>
  <:item>Customize side, alignment, offsets, collision handling.</:item>
  <:item>Optionally render a pointing arrow.</:item>
  <:item>Supports custom open and close delays.</:item>
  <:item>Ignored by screen readers.</:item>
</.highlights>

## Anatomy

```heex
<HoverCard.root>
  <HoverCard.trigger />
  <HoverCard.portal />
  <HoverCard.content />
  <HoverCard.arrow />
</HoverCard.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Trigger">The `trigger` part.</:part>
  <:part name="Portal">The `portal` part.</:part>
  <:part name="Content">The `content` part.</:part>
  <:part name="Arrow">The `arrow` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.HoverCard} function={:root} />

### Trigger

<.props_table module={EssenceUI.Primitives.HoverCard} function={:trigger} />

### Portal

<.props_table module={EssenceUI.Primitives.HoverCard} function={:portal} />

### Content

<.props_table module={EssenceUI.Primitives.HoverCard} function={:content} />

### Arrow

<.props_table module={EssenceUI.Primitives.HoverCard} function={:arrow} />

## Examples

See the live demo above and `storybook/primitives/hover_card.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.
