---
title: Hover Card
description: For sighted users to preview content available behind a link.
---

For sighted users to preview content available behind a link.

<.demo theme="light" variant="primitive" component="hover-card" css={primitive_css("hover-card")}>

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
                  href="https://github.com/"
                  target="_blank"
                  rel="noreferrer noopener"
                >
                  <div class="Image normal" style="display: flex; align-items: center; justify-content: center; background: var(--gray-3); color: var(--gray-11); font-weight: 600; font-size: 14px;" aria-hidden="true">E</div>
                </a>
              </HoverCard.trigger>
              <HoverCard.portal id="hover-card-portal">
                <HoverCard.content
                  id="hover-card-content"
                  class="HoverCardContent"
                  side_offset={5}
                >
                  <div style="display: flex; flex-direction: column; gap: 7px;">
                    <div class="Image large" style="display: flex; align-items: center; justify-content: center; background: var(--gray-3); color: var(--gray-11); font-weight: 600; font-size: 24px;" aria-hidden="true">E</div>
                    <div style="display: flex; flex-direction: column; gap: 15px;">
                      <div>
                        <div class="Text bold">Essence</div>
                        <div class="Text faded">@essence_ui</div>
                      </div>
                      <div class="Text">
                        Unstyled, accessible UI components for Phoenix LiveView. Primitives, colors, and themes for building high-quality interfaces.
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
              </HoverCard.portal>
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

Import all parts and piece them together.

```heex
<HoverCard.root>
  <HoverCard.trigger />
  <HoverCard.portal>
    <HoverCard.content>
      <HoverCard.arrow />
    </HoverCard.content>
  </HoverCard.portal>
</HoverCard.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a hover card.</:part>
  <:part name="Trigger">The link that opens the hover card when hovered. Set `content_id` to the content element's `id` for `aria-describedby`.</:part>
  <:part name="Portal">When used, portals the content part into the target (default `body`).</:part>
  <:part name="Content">The component that pops out when the hover card is open.</:part>
  <:part name="Arrow">An optional arrow element to render alongside the content. Must be rendered inside `HoverCard.content`.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a hover card.

Use `open` with `on_open_change` for controlled open state in LiveView:

```heex
<HoverCard.root id="profile-card" open={@open} on_open_change="hover_card_open_change">
  …
</HoverCard.root>
```

```elixir
def handle_event("hover_card_open_change", %{"open" => open}, socket) do
  {:noreply, assign(socket, :open, open)}
end
```

<.props_table module={EssenceUI.Primitives.HoverCard} function={:root} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the hover card is open.</:row>
</.data_attributes_table>

### Trigger

The link that opens the hover card when hovered.

<.props_table module={EssenceUI.Primitives.HoverCard} function={:trigger} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the hover card is open.</:row>
</.data_attributes_table>

### Portal

When used, portals the content part into the target (default `body`).

<.props_table module={EssenceUI.Primitives.HoverCard} function={:portal} />

### Content

The component that pops out when the hover card is open.

<.props_table module={EssenceUI.Primitives.HoverCard} function={:content} />

<.data_attributes_table>
  <:row name="[data-state]" values={"open | closed"}>Reflects whether the hover card is open.</:row>
  <:row name="[data-side]" values={"top | right | bottom | left"}>Preferred side relative to the trigger.</:row>
  <:row name="[data-align]" values={"start | center | end"}>Alignment along the side.</:row>
</.data_attributes_table>

### Arrow

An optional arrow element to render alongside the hover card. This can be used to help visually link the trigger with the content. Must be rendered inside `HoverCard.content`.

<.props_table module={EssenceUI.Primitives.HoverCard} function={:arrow} />

## Examples

### Show instantly

Use `open_delay` and `close_delay` to control the time it takes for the hover card to open and close.

```heex
<HoverCard.root id="instant-hover-card" open_delay={0} close_delay={0}>
  <HoverCard.trigger id="instant-hover-card-trigger" content_id="instant-hover-card-content">
    …
  </HoverCard.trigger>
  <HoverCard.portal id="instant-hover-card-portal">
    <HoverCard.content id="instant-hover-card-content" class="HoverCardContent">
      …
    </HoverCard.content>
  </HoverCard.portal>
</HoverCard.root>
```

## Accessibility

The hover card is intended for sighted users only; the content will be inaccessible to keyboard users.

<.keyboard_table>
  <:row keys="Tab">Opens/closes the hover card.</:row>
  <:row keys="Enter">Opens the hover card link.</:row>
</.keyboard_table>
