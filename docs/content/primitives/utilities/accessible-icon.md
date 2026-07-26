---
title: Accessible Icon
description: Makes icons accessible by adding a label.
---

Makes icons accessible by adding a label.

<.demo variant="primitive" component="accessible-icon" css={primitive_css("accessible-icon")}>

  <:heex>
    <button
              class="IconButton"
              type="button"
            >
              <AccessibleIcon.accessible_icon label="Close">
                <svg
                  width="15"
                  height="15"
                  viewBox="0 0 15 15"
                  fill="none"
                  aria-hidden="true"
                >
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
  <:item>Accessible Icon utility primitive.</:item>
</.highlights>

## Anatomy

```heex
<AccessibleIcon.accessible_icon>
</AccessibleIcon.accessible_icon>
```

<.anatomy>
  <:part name="Accessible Icon">The `accessible_icon` part.</:part>
</.anatomy>

## API Reference

### Accessible Icon

<.props_table module={EssenceUI.Primitives.AccessibleIcon} function={:accessible_icon} />
