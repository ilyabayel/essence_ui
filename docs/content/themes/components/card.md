---
title: Card
description: Container for grouping related content.
---

Cards frame content with Themes surface styles.

<.demo heex={~s[<.card size="2"><.flex direction="column" gap="2"><.heading as="h3" size="3">Sign in</.heading><.text size="2" color="gray">Use your work email to continue.</.text><.button>Continue</.button></.flex></.card>]}>
  <.card size="2">
    <.flex direction="column" gap="2">
      <.heading as="h3" size="3">Sign in</.heading>
      <.text size="2" color="gray">Use your work email to continue.</.text>
      <.button>Continue</.button>
    </.flex>
  </.card>
</.demo>

## Variants

<.demo heex={~s[<.flex gap="3" wrap="wrap"><.card variant="surface" size="1"><.text size="2">Surface</.text></.card><.card variant="classic" size="1"><.text size="2">Classic</.text></.card><.card variant="ghost" size="1"><.text size="2">Ghost</.text></.card></.flex>]}>
  <.flex gap="3" wrap="wrap">
    <.card variant="surface" size="1"><.text size="2">Surface</.text></.card>
    <.card variant="classic" size="1"><.text size="2">Classic</.text></.card>
    <.card variant="ghost" size="1"><.text size="2">Ghost</.text></.card>
  </.flex>
</.demo>

## API Reference

<.props_table module={EssenceUI.Components.Card} function={:card} />
