---
title: Callout
description: Short message to attract user's attention.
---

<.demo>
  <:heex code={~S|<.callout><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need admin privileges to install and access this application.</:text></.callout>|}>
      <.callout>
        <:icon>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
        </:icon>
        <:text>
          You will need admin privileges to install and access this application.
        </:text>
      </.callout>
  </:heex>
</.demo>

## API Reference

### Root

Groups icon and text parts. This component is based on the `div` element and supports common margin props.

<.props_table module={EssenceUI.Components.Callout} function={:callout} />

### Icon

Provides width and height for the icon associated with the callout. Pass an SVG inside the `<:icon>` slot.

### Text

Renders the callout text. Pass content inside the `<:text>` slot.

## Examples

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" align="start"><.callout size="1"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need admin privileges to install and access this application.</:text></.callout><.callout size="2"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need admin privileges to install and access this application.</:text></.callout><.callout size="3"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need admin privileges to install and access this application.</:text></.callout></.flex>|}>
      <.flex direction="column" gap="3" align="start">
        <.callout size="1">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need admin privileges to install and access this application.
          </:text>
        </.callout>
        <.callout size="2">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need admin privileges to install and access this application.
          </:text>
        </.callout>
        <.callout size="3">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need admin privileges to install and access this application.
          </:text>
        </.callout>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.callout variant="soft"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.</:text></.callout><.callout variant="surface"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.</:text></.callout><.callout variant="outline"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.</:text></.callout></.flex>|}>
      <.flex direction="column" gap="3">
        <.callout variant="soft">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.
          </:text>
        </.callout>
        <.callout variant="surface">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.
          </:text>
        </.callout>
        <.callout variant="outline">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.
          </:text>
        </.callout>
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.callout color="blue"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.</:text></.callout><.callout color="green"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.</:text></.callout><.callout color="red"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.</:text></.callout></.flex>|}>
      <.flex direction="column" gap="3">
        <.callout color="blue">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.
          </:text>
        </.callout>
        <.callout color="green">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.
          </:text>
        </.callout>
        <.callout color="red">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            You will need <.es_link href="#">admin privileges</.es_link> to install and access this application.
          </:text>
        </.callout>
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to add additional contrast.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3"><.callout color="gray" variant="soft"><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>An update to Essence UI is available. See what's new in the latest release.</:text></.callout><.callout color="gray" variant="soft" high_contrast><:icon><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg></:icon><:text>An update to Essence UI is available. See what's new in the latest release.</:text></.callout></.flex>|}>
      <.flex direction="column" gap="3">
        <.callout color="gray" variant="soft">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            An update to Essence UI is available. See what's new in the latest release.
          </:text>
        </.callout>
        <.callout color="gray" variant="soft" high_contrast>
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            An update to Essence UI is available. See what's new in the latest release.
          </:text>
        </.callout>
      </.flex>
  </:heex>
</.demo>