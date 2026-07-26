---
title: Aspect Ratio
description: Displays content within a desired ratio.
---

Displays content within a desired ratio.

<.demo variant="primitive" component="aspect-ratio" css={primitive_css("aspect-ratio")}>
  <:heex>
    <div class="DemoAspectRatioContainer">
      <AspectRatio.aspect_ratio ratio={16 / 9}>
        <img
          class="DemoAspectRatioImage"
          src="https://images.unsplash.com/photo-1535025183041-0991a977e25b?w=300&dpr=2&q=80"
          alt="Landscape photograph by Tobias Tullius"
        />
      </AspectRatio.aspect_ratio>
    </div>
  </:heex>
</.demo>

<.highlights>
  <:item>Accepts any custom ratio.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<AspectRatio.aspect_ratio />
```

<.anatomy>
  <:part name="Aspect Ratio">Contains the content you want to constrain to a given ratio.</:part>
</.anatomy>

## API Reference

### Aspect Ratio

Contains the content you want to constrain to a given ratio.

<.props_table module={EssenceUI.Primitives.AspectRatio} function={:aspect_ratio} />
