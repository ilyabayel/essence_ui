---
title: Avatar
description: An image element with a fallback for representing the user.
---

An image element with a fallback for representing the user.

<.demo theme="light" variant="primitive" component="avatar" css={primitive_css("avatar")}>
  <:heex>
    <div style="display: flex; gap: 20px;">
      <Avatar.root
        id="avatar-1"
        class="DemoAvatarRoot"
      >
        <Avatar.image
          class="DemoAvatarImage"
          src="https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?&w=128&h=128&dpr=2&q=80"
          alt="Colm Tuite"
        />
        <Avatar.fallback
          class="DemoAvatarFallback"
          delay_ms={600}
        >
          CT
        </Avatar.fallback>
      </Avatar.root>
      <Avatar.root
        id="avatar-2"
        class="DemoAvatarRoot"
      >
        <Avatar.image
          class="DemoAvatarImage"
          src="https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-1.2.1&w=128&h=128&dpr=2&q=80"
          alt="Pedro Duarte"
        />
        <Avatar.fallback
          class="DemoAvatarFallback"
          delay_ms={600}
        >
          JD
        </Avatar.fallback>
      </Avatar.root>
      <Avatar.root
        id="avatar-3"
        class="DemoAvatarRoot"
      >
        <Avatar.fallback class="DemoAvatarFallback">PD</Avatar.fallback>
      </Avatar.root>
    </div>
  </:heex>
</.demo>

<.highlights>
  <:item>Automatic and manual control over when the image renders.</:item>
  <:item>Fallback part accepts any children.</:item>
  <:item>Optionally delay fallback rendering to avoid content flashing.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<Avatar.root id="…">
  <Avatar.image src="…" alt="…" />
  <Avatar.fallback>…</Avatar.fallback>
</Avatar.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of an avatar.</:part>
  <:part name="Image">The image to render when it has loaded.</:part>
  <:part name="Fallback">Placeholder shown while loading or on error.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of an avatar.

<.props_table module={EssenceUI.Primitives.Avatar} function={:root} />

<.data_attributes_table>
  <:row name="[data-status]" values={"idle | loading | loaded | error"}>Reflects the loading status of the avatar image.</:row>
</.data_attributes_table>

### Image

The image to render. By default it will only render when it has loaded. You can use the `on_loading_status_change` event if you need more control.

<.props_table module={EssenceUI.Primitives.Avatar} function={:image} />

### Fallback

An element that renders when the image hasn't loaded. This means whilst it's loading, or if there was an error. If you notice a flash during loading, you can provide a `delay_ms` attribute to delay its rendering so it only renders for those with slower connections. For more control, use the `on_loading_status_change` event on `Avatar.image`.

<.props_table module={EssenceUI.Primitives.Avatar} function={:fallback} />

## Examples

### Clickable Avatar with tooltip

You can compose the Avatar with a [Tooltip](/primitives/docs/components/tooltip) to display extra information.

```heex
<Tooltip.provider>
  <Tooltip.root id="avatar-tooltip">
    <Tooltip.trigger
      id="avatar-tooltip-trigger"
      content_id="avatar-tooltip-content"
      as="div"
    >
      <Avatar.root id="avatar-tooltip-avatar" class="DemoAvatarRoot">
        <Avatar.image
          class="DemoAvatarImage"
          src="https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?&w=128&h=128&dpr=2&q=80"
          alt="Colm Tuite"
        />
        <Avatar.fallback class="DemoAvatarFallback" delay_ms={600}>
          CT
        </Avatar.fallback>
      </Avatar.root>
    </Tooltip.trigger>
    <Tooltip.content id="avatar-tooltip-content" side="top">
      Colm Tuite
      <Tooltip.arrow />
    </Tooltip.content>
  </Tooltip.root>
</Tooltip.provider>
```
