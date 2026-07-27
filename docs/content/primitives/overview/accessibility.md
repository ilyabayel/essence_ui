---
title: Accessibility
description: Essence UI Primitives follow WAI-ARIA authoring practices and handle focus, keyboard, and semantics for you.
---

Essence UI Primitives follow the WAI-ARIA authoring practices guidelines. We take care of many of the difficult implementation details related to accessibility, including `aria` and `role` attributes, focus management, and keyboard navigation. That means you can use our components as-is in most contexts and rely on functionality to follow expected accessibility patterns.

## WAI-ARIA

[WAI-ARIA](https://www.w3.org/TR/wai-aria-1.2/), published and maintained by the W3C, specifies the semantics for many common UI patterns. This provides meaning for controls that aren't built using native browser elements. For example, if you use a `div` instead of a `button` to create a button, there are attributes you need to add to convey that it's a button for screen readers or voice recognition tools.

In addition to semantics, there are behaviors expected from different types of components. The [WAI-ARIA authoring practices](https://www.w3.org/WAI/ARIA/apg/) provide guidance for implementing those behaviors. Primitives aim to encode those patterns for Phoenix LiveView.

## Accessible labels

With many built-in form controls, the native HTML `label` element provides semantic meaning for corresponding `input` elements. For custom controls, [WAI-ARIA describes how to provide accessible names and descriptions](https://www.w3.org/TR/wai-aria-1.2/#namecalculation).

Where possible, primitives include abstractions to make labelling simple. The [Label](/primitives/docs/components/label) primitive is designed to work with many controls. Ultimately it is up to you to provide labels so users have the proper context when navigating your application.

## Keyboard navigation

Complex components like [Tabs](/primitives/docs/components/tabs) and [Dialog](/primitives/docs/components/dialog) come with expectations on how to interact with content using a keyboard. Primitives provide basic keyboard support in accordance with the WAI-ARIA authoring practices. Each component page documents its keyboard interactions.

## Focus management

Proper keyboard navigation and good labelling often go hand-in-hand with managing focus. When a user interacts with an element and something changes, it is often helpful to move focus so the next tab stop is logical. For screen reader users, moving focus often results in an announcement that relies on proper labelling.

In many primitives, we move focus based on typical interactions. For example, in [Alert Dialog](/primitives/docs/components/alert-dialog), when the modal opens, focus moves to an appropriate action so the user can respond to the prompt.
