---
title: Scroll Area
description: Augments native scroll functionality for custom, cross-browser styling.
---

Augments native scroll functionality for custom, cross-browser styling.

<.demo theme="light" variant="primitive" component="scroll-area" css={primitive_css("scroll-area")}>
  <:heex>
    <ScrollArea.root
      id="scroll-area-primitive"
      class="DemoScrollAreaRoot"
      type="always"
    >
      <ScrollArea.viewport class="DemoScrollAreaViewport">
        <div style="padding: 15px 20px;">
          <div class="DemoScrollAreaText">Tags</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.50</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.49</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.48</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.47</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.46</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.45</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.44</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.43</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.42</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.41</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.40</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.39</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.38</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.37</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.36</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.35</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.34</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.33</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.32</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.31</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.30</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.29</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.28</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.27</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.26</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.25</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.24</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.23</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.22</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.21</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.20</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.19</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.18</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.17</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.16</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.15</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.14</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.13</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.12</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.11</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.10</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.9</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.8</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.7</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.6</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.5</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.4</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.3</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.2</div>
          <div class="DemoScrollAreaTag">v1.2.0-beta.1</div>
        </div>
      </ScrollArea.viewport>
      <ScrollArea.scrollbar
        class="DemoScrollAreaScrollbar"
        orientation="vertical"
      >
        <ScrollArea.thumb class="DemoScrollAreaThumb" />
      </ScrollArea.scrollbar>
      <ScrollArea.scrollbar
        class="DemoScrollAreaScrollbar"
        orientation="horizontal"
      >
        <ScrollArea.thumb class="DemoScrollAreaThumb" />
      </ScrollArea.scrollbar>
      <ScrollArea.corner class="DemoScrollAreaCorner" />
    </ScrollArea.root>
  </:heex>
</.demo>

<.highlights>
  <:item>Scrollbar sits on top of the scrollable content, taking up no space.</:item>
  <:item>Scrolling is native; no underlying position movements via CSS transformations.</:item>
  <:item>Shims pointer behaviors only when interacting with the controls, so keyboard controls are unaffected.</:item>
  <:item>Supports Right to Left direction.</:item>
</.highlights>

## Anatomy

Import all parts and piece them together.

```heex
<ScrollArea.root id="…">
  <ScrollArea.viewport>…</ScrollArea.viewport>
  <ScrollArea.scrollbar orientation="vertical">
    <ScrollArea.thumb />
  </ScrollArea.scrollbar>
  <ScrollArea.scrollbar orientation="horizontal">
    <ScrollArea.thumb />
  </ScrollArea.scrollbar>
  <ScrollArea.corner />
</ScrollArea.root>
```

<.anatomy>
  <:part name="Root">Contains all the parts of a scroll area.</:part>
  <:part name="Viewport">The scrollable viewport area.</:part>
  <:part name="Scrollbar">Custom scrollbar for vertical or horizontal scrolling.</:part>
  <:part name="Thumb">The draggable thumb inside a scrollbar.</:part>
  <:part name="Corner">Where vertical and horizontal scrollbars meet.</:part>
</.anatomy>

## API Reference

### Root

Contains all the parts of a scroll area.

The `type` attribute describes scrollbar visibility, similar to macOS scrollbar preferences: `"auto"` shows scrollbars when content overflows; `"always"` keeps them visible; `"scroll"` shows them while scrolling; `"hover"` shows them while scrolling or hovering the scroll area (default).

When `type` is `"scroll"` or `"hover"`, `scroll_hide_delay` sets how long scrollbars stay visible after interaction (milliseconds, default `600`).

<.props_table module={EssenceUI.Primitives.ScrollArea} function={:root} />

### Viewport

The viewport area of the scroll area.

<.props_table module={EssenceUI.Primitives.ScrollArea} function={:viewport} />

### Scrollbar

The vertical scrollbar. Add a second `scrollbar` with an `orientation` attribute to enable horizontal scrolling.

<.props_table module={EssenceUI.Primitives.ScrollArea} function={:scrollbar} />

<.data_attributes_table>
  <:row name="[data-state]" values={"visible | hidden"}>Reflects whether the scrollbar is visible.</:row>
  <:row name="[data-orientation]" values={"vertical | horizontal"}>The orientation of the scrollbar.</:row>
</.data_attributes_table>

### Thumb

The thumb to be used in `ScrollArea.scrollbar`.

<.props_table module={EssenceUI.Primitives.ScrollArea} function={:thumb} />

<.data_attributes_table>
  <:row name="[data-state]" values={"visible | hidden"}>Reflects whether the thumb is visible.</:row>
</.data_attributes_table>

### Corner

The corner where both vertical and horizontal scrollbars meet.

<.props_table module={EssenceUI.Primitives.ScrollArea} function={:corner} />

## Accessibility

In most cases, it's best to rely on native scrolling and work with the customization options available in CSS. When that isn't enough, `ScrollArea` provides additional customizability while maintaining the browser's native scroll behavior (as well as accessibility features, like keyboard scrolling).

### Keyboard Interactions

Scrolling via keyboard is supported by default because the component relies on native scrolling. Specific keyboard interactions may differ between platforms, so we do not specify them here or add specific event listeners to handle scrolling via key events.
