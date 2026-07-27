---
title: Card
description: Container that groups related content and actions.
---

<.demo>
  <:heex code={~S|<.box max_width="240px"><.card><.flex gap="3" align="center"><.avatar size="3" src="https://images.unsplash.com/photo-1607346256330-dee7af15f7c5?&w=64&h=64&dpr=2&q=70&crop=focalpoint&fp-x=0.67&fp-y=0.5&fp-z=1.4&fit=crop" radius="full" fallback="T" /><.box><.text as="div" size="2" weight="bold">Teodros Girmay</.text><.text as="div" size="2" color="gray">Engineering</.text></.box></.flex></.card></.box>|}>
      <.box max_width="240px">
        <.card>
          <.flex gap="3" align="center">
            <.avatar
              size="3"
              src="https://images.unsplash.com/photo-1607346256330-dee7af15f7c5?&w=64&h=64&dpr=2&q=70&crop=focalpoint&fp-x=0.67&fp-y=0.5&fp-z=1.4&fit=crop"
              radius="full"
              fallback="T"
            />
            <.box>
              <.text as="div" size="2" weight="bold">Teodros Girmay</.text>
              <.text as="div" size="2" color="gray">Engineering</.text>
            </.box>
          </.flex>
        </.card>
      </.box>
  </:heex>
</.demo>

## API Reference

This component is based on the `div` element and supports common margin props.

<.props_table module={EssenceUI.Components.Card} function={:card} />

## Examples

### As another element

Nest a link (or button) inside the card for interactive surfaces. Prefer this pattern until `as_child` composition merges props into the child element.

<.demo>
  <:heex code={~S|<.box max_width="350px"><.card><a href="#" style="text-decoration: none; color: inherit; display: block;"><.text as="div" size="2" weight="bold">Quick start</.text><.text as="div" color="gray" size="2">Start building your next project in minutes</.text></a></.card></.box>|}>
      <.box max_width="350px">
        <.card>
          <a href="#" style="text-decoration: none; color: inherit; display: block;">
            <.text as="div" size="2" weight="bold">Quick start</.text>
            <.text as="div" color="gray" size="2">Start building your next project in minutes</.text>
          </a>
        </.card>
      </.box>
  </:heex>
</.demo>

### Size

Use the `size` prop to control the size.

<.demo>
  <:heex code={~S|<.flex gap="3" direction="column"><.box width="350px"><.card size="1"><.flex gap="3" align="center"><.avatar size="3" radius="full" fallback="T" color="indigo" /><.box><.text as="div" size="2" weight="bold">Teodros Girmay</.text><.text as="div" size="2" color="gray">Engineering</.text></.box></.flex></.card></.box><.box width="400px"><.card size="2"><.flex gap="4" align="center"><.avatar size="4" radius="full" fallback="T" color="indigo" /><.box><.text as="div" weight="bold">Teodros Girmay</.text><.text as="div" color="gray">Engineering</.text></.box></.flex></.card></.box><.box width="500px"><.card size="3"><.flex gap="4" align="center"><.avatar size="5" radius="full" fallback="T" color="indigo" /><.box><.text as="div" size="4" weight="bold">Teodros Girmay</.text><.text as="div" size="4" color="gray">Engineering</.text></.box></.flex></.card></.box></.flex>|}>
      <.flex gap="3" direction="column">
        <.box width="350px">
          <.card size="1">
            <.flex gap="3" align="center">
              <.avatar size="3" radius="full" fallback="T" color="indigo" />
              <.box>
                <.text as="div" size="2" weight="bold">Teodros Girmay</.text>
                <.text as="div" size="2" color="gray">Engineering</.text>
              </.box>
            </.flex>
          </.card>
        </.box>
        <.box width="400px">
          <.card size="2">
            <.flex gap="4" align="center">
              <.avatar size="4" radius="full" fallback="T" color="indigo" />
              <.box>
                <.text as="div" weight="bold">Teodros Girmay</.text>
                <.text as="div" color="gray">Engineering</.text>
              </.box>
            </.flex>
          </.card>
        </.box>
        <.box width="500px">
          <.card size="3">
            <.flex gap="4" align="center">
              <.avatar size="5" radius="full" fallback="T" color="indigo" />
              <.box>
                <.text as="div" size="4" weight="bold">Teodros Girmay</.text>
                <.text as="div" size="4" color="gray">Engineering</.text>
              </.box>
            </.flex>
          </.card>
        </.box>
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="3" max_width="350px"><.card variant="surface"><.text as="div" size="2" weight="bold">Quick start</.text><.text as="div" color="gray" size="2">Start building your next project in minutes</.text></.card><.card variant="classic"><.text as="div" size="2" weight="bold">Quick start</.text><.text as="div" color="gray" size="2">Start building your next project in minutes</.text></.card></.flex>|}>
      <.flex direction="column" gap="3" max_width="350px">
        <.card variant="surface">
          <.text as="div" size="2" weight="bold">Quick start</.text>
          <.text as="div" color="gray" size="2">Start building your next project in minutes</.text>
        </.card>
        <.card variant="classic">
          <.text as="div" size="2" weight="bold">Quick start</.text>
          <.text as="div" color="gray" size="2">Start building your next project in minutes</.text>
        </.card>
      </.flex>
  </:heex>
</.demo>

### With inset content

Use the `<.inset>` utility to align content flush with the sides of the card.

<.demo>
  <:heex code={~S|<.box max_width="240px"><.card size="2"><.inset side="top" clip="padding-box"><img src="https://images.unsplash.com/photo-1617050318658-a9a3175e34cb?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80" alt="Bold typography" style="display: block; object-fit: cover; width: 100%; height: 140px; background-color: var(--gray-5);" /></.inset><.box mt="3"><.text as="p" size="3"><.strong>Typography</.strong> is the art and technique of arranging type to make written language legible, readable and appealing when displayed.</.text></.box></.card></.box>|}>
      <.box max_width="240px">
        <.card size="2">
          <.inset side="top" clip="padding-box">
            <img
              src="https://images.unsplash.com/photo-1617050318658-a9a3175e34cb?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=80"
              alt="Bold typography"
              style="display: block; object-fit: cover; width: 100%; height: 140px; background-color: var(--gray-5);"
            />
          </.inset>
          <.box mt="3">
            <.text as="p" size="3">
              <.strong>Typography</.strong>
              is the art and technique of arranging type to make written language legible, readable and appealing when displayed.
            </.text>
          </.box>
        </.card>
      </.box>
  </:heex>
</.demo>
