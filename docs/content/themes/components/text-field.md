---
title: Text Field
description: Captures text input from the user.
---

Text fields collect short strings with Themes sizing and variants.

<.demo>
  <:heex code={~S|<.text_field placeholder="Email address" />|}>
      <.text_field placeholder="Email address" />
  </:heex>
</.demo>

## Variants

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" style="max-width: 16rem;"><.text_field variant="surface" placeholder="Surface" /><.text_field variant="classic" placeholder="Classic" /><.text_field variant="soft" placeholder="Soft" /></.flex>|}>
      <.flex direction="column" gap="3" style="max-width: 16rem;">
        <.text_field variant="surface" placeholder="Surface" />
        <.text_field variant="classic" placeholder="Classic" />
        <.text_field variant="soft" placeholder="Soft" />
      </.flex>
  </:heex>
</.demo>

## With slot

<.demo>
  <:heex code={~S|<.text_field placeholder="Search"><:slot side="left">🔍</:slot></.text_field>|}>
      <.text_field placeholder="Search">
        <:slot side="left">🔍</:slot>
      </.text_field>
  </:heex>
</.demo>

## API Reference

<.props_table module={EssenceUI.Components.TextField} function={:text_field} />
