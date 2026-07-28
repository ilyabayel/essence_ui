---
title: Aspect Ratio
description: Displays content within a desired ratio.
---

<.demo>
  <:heex code={~S|<.aspect_ratio ratio={16/8}><img src="https://images.unsplash.com/photo-1479030160180-b1860951d696?&auto=format&fit=crop&w=1200&q=80" alt="A house in a forest" style="object-fit: cover; width: 100%; height: 100%; border-radius: var(--radius-2);" /></.aspect_ratio>|}>
      <.aspect_ratio ratio={16/8}>
        <img
          src="https://images.unsplash.com/photo-1479030160180-b1860951d696?&auto=format&fit=crop&w=1200&q=80"
          alt="A house in a forest"
          style="object-fit: cover; width: 100%; height: 100%; border-radius: var(--radius-2);"
        />
      </.aspect_ratio>
  </:heex>
</.demo>

## API Reference

This component wraps the Aspect Ratio primitive and preserves layout proportions for its child content.

<.props_table module={EssenceUI.Components.AspectRatio} function={:aspect_ratio} />
