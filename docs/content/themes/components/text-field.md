---
title: Text Field
description: Captures text input from the user.
---

Text fields collect short strings with Themes sizing and variants.

<.demo heex={~s[<.text_field placeholder="Email address" />]}>
  <.text_field placeholder="Email address" />
</.demo>

## Variants

<.demo heex={~s[<.flex direction="column" gap="3" style="max-width: 16rem;"><.text_field variant="surface" placeholder="Surface" /><.text_field variant="classic" placeholder="Classic" /><.text_field variant="soft" placeholder="Soft" /></.flex>]}>
  <.flex direction="column" gap="3" style="max-width: 16rem;">
    <.text_field variant="surface" placeholder="Surface" />
    <.text_field variant="classic" placeholder="Classic" />
    <.text_field variant="soft" placeholder="Soft" />
  </.flex>
</.demo>

## With slot

<.demo heex={~s[<.text_field placeholder="Search"><:slot side="left">🔍</:slot></.text_field>]}>
  <.text_field placeholder="Search">
    <:slot side="left">🔍</:slot>
  </.text_field>
</.demo>

## API Reference

<.props_table module={EssenceUI.Components.TextField} function={:text_field} />
