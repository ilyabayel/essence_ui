---
title: Accessible Icon
description: Makes icons accessible by adding a label.
---

Makes icons accessible by adding a label.

<.demo theme="light" variant="primitive" component="accessible-icon" css={primitive_css("accessible-icon")}>
  <:heex>
    <button class="IconButton" type="button">
      <AccessibleIcon.accessible_icon label="Close">
        <svg width="15" height="15" viewBox="0 0 15 15" fill="none" aria-hidden="true">
          <path
            d="M11.782 4.032a.575.575 0 1 0-.813-.814L7.5 6.687 4.032 3.218a.575.575 0 0 0-.814.814L6.687 7.5l-3.469 3.468a.575.575 0 0 0 .814.814L7.5 8.313l3.469 3.469a.575.575 0 0 0 .813-.814L8.313 7.5l3.469-3.468Z"
            fill="currentColor"
          />
        </svg>
      </AccessibleIcon.accessible_icon>
    </button>
  </:heex>
</.demo>

<.highlights>
  <:item>Quickly make any icon accessible by wrapping it and providing a meaningful label.</:item>
  <:item>No visual difference, but announced correctly by screen readers.</:item>
</.highlights>

## Anatomy

Import the component.

```heex
<AccessibleIcon.accessible_icon label="…">
  …icon…
</AccessibleIcon.accessible_icon>
```

<.anatomy>
  <:part name="Accessible Icon">Contains the icon to make accessible.</:part>
</.anatomy>

## API Reference

### Accessible Icon

Contains the icon to make accessible.

<.props_table module={EssenceUI.Primitives.AccessibleIcon} function={:accessible_icon} />

## Accessibility

Most icons or icon systems come with no accessibility built-in. For example, the same visual **cross** icon may in fact mean **"close"** or **"delete"**. This component lets you give meaning to icons used throughout your app.

This is built with [Visually Hidden](/primitives/docs/utilities/visually-hidden).
