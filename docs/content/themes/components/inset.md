---
title: Inset
description: Applies a negative margin to allow content to bleed into the surrounding container.
---

<.demo>
  <:heex code={~S|<.box max_width="240px"><.card size="2"><.inset clip="padding-box" side="top" pb="current"><img src="https://images.unsplash.com/photo-1617050318658-a9a3175e34cb?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Bold typography" style="display: block; object-fit: cover; width: 100%; height: 140px; background-color: var(--gray-5);" /></.inset><.text as="p" size="3"><.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.</.text></.card></.box>|}>
      <.box max_width="240px">
        <.card size="2">
          <.inset clip="padding-box" side="top" pb="current">
            <img
              src="https://images.unsplash.com/photo-1617050318658-a9a3175e34cb?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
              alt="Bold typography"
              style="display: block; object-fit: cover; width: 100%; height: 140px; background-color: var(--gray-5);"
            />
          </.inset>
          <.text as="p" size="3">
            <.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.
          </.text>
        </.card>
      </.box>
  </:heex>
</.demo>

## API Reference

This component is based on the `div` element and supports common margin props.

<.props_table module={EssenceUI.Utilities.Inset} function={:inset} />
