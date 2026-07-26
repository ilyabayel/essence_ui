---
title: Avatar
description: An image element with a fallback for representing the user.
---

An image element with a fallback for representing the user.

<.demo variant="primitive" component="avatar" css={primitive_css("avatar")}>

  <:heex>
    <div style="display: flex; gap: 20px;">
              <Avatar.root
                id="avatar-1"
                class="AvatarRoot"
              >
                <Avatar.image
                  class="AvatarImage"
                  src="https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?&w=128&h=128&dpr=2&q=80"
                  alt="Colm Tuite"
                />
                <Avatar.fallback
                  class="AvatarFallback"
                  delay_ms={600}
                >
                  CT
                </Avatar.fallback>
              </Avatar.root>
              <Avatar.root
                id="avatar-2"
                class="AvatarRoot"
              >
                <Avatar.image
                  class="AvatarImage"
                  src="https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-1.2.1&w=128&h=128&dpr=2&q=80"
                  alt="Pedro Duarte"
                />
                <Avatar.fallback
                  class="AvatarFallback"
                  delay_ms={600}
                >
                  JD
                </Avatar.fallback>
              </Avatar.root>
              <Avatar.root
                id="avatar-3"
                class="AvatarRoot"
              >
                <Avatar.fallback class="AvatarFallback">PD</Avatar.fallback>
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

```heex
<Avatar.root>
  <Avatar.image />
  <Avatar.fallback />
</Avatar.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Image">The `image` part.</:part>
  <:part name="Fallback">The `fallback` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Avatar} function={:root} />

### Image

<.props_table module={EssenceUI.Primitives.Avatar} function={:image} />

### Fallback

<.props_table module={EssenceUI.Primitives.Avatar} function={:fallback} />

## Examples

See the live demo above and `storybook/primitives/avatar.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.
