---
title: Tooltip
description: A popup that displays information related to an element.
---

Headless tooltip primitive. Pair with your own styles or Themes `Tooltip`.

<.demo variant="primitive" component="tooltip" heex={~s[<Tooltip.root><Tooltip.trigger class="Button violet">Hover</Tooltip.trigger><Tooltip.content class="TooltipContent">Add to library</Tooltip.content></Tooltip.root>]} css={~s[/* See assets/css/primitives/tooltip.css */]}>
  <Tooltip.root>
    <Tooltip.trigger class="Button violet">
      Hover
    </Tooltip.trigger>
    <Tooltip.portal>
      <Tooltip.content class="TooltipContent" side_offset={5}>
        Add to library
        <Tooltip.arrow class="TooltipArrow" />
      </Tooltip.content>
    </Tooltip.portal>
  </Tooltip.root>
</.demo>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Tooltip} function={:root} />
