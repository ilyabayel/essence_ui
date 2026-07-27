---
title: Avatar
description: Profile picture, user initials or fallback icon.
---

<.demo>
  <:heex code={~S|<.flex gap="2"><.avatar src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /><.avatar fallback="A" /></.flex>|}>
      <.flex gap="2">
        <.avatar
          src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop"
          fallback="A"
        />
        <.avatar fallback="A" />
      </.flex>
  </:heex>
</.demo>

## API Reference

This component wraps the Avatar primitive and supports common margin props.

<.props_table module={EssenceUI.Components.Avatar} function={:avatar} />

## Examples

### Size

Use the `size` prop to control the size of the avatar.

<.demo>
  <:heex code={~S|<.flex align="center" gap="4"><.avatar size="1" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /><.avatar size="2" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /><.avatar size="3" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /><.avatar size="4" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /><.avatar size="5" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /><.avatar size="6" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /><.avatar size="7" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /><.avatar size="8" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" /></.flex>|}>
      <.flex align="center" gap="4">
        <.avatar size="1" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" />
        <.avatar size="2" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" />
        <.avatar size="3" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" />
        <.avatar size="4" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" />
        <.avatar size="5" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" />
        <.avatar size="6" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" />
        <.avatar size="7" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" />
        <.avatar size="8" src="https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?&w=256&h=256&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop" fallback="A" />
      </.flex>
  </:heex>
</.demo>

### Variant

Use the `variant` prop to control the visual style of the avatar.

<.demo>
  <:heex code={~S|<.flex gap="2"><.avatar variant="solid" fallback="A" /><.avatar variant="soft" fallback="A" /></.flex>|}>
      <.flex gap="2">
        <.avatar variant="solid" fallback="A" />
        <.avatar variant="soft" fallback="A" />
      </.flex>
  </:heex>
</.demo>

### Color

Use the `color` prop to assign a specific accent color.

<.demo>
  <:heex code={~S|<.flex gap="2"><.avatar variant="solid" color="indigo" fallback="A" /><.avatar variant="solid" color="cyan" fallback="A" /><.avatar variant="solid" color="orange" fallback="A" /><.avatar variant="solid" color="crimson" fallback="A" /></.flex>|}>
      <.flex gap="2">
        <.avatar variant="solid" color="indigo" fallback="A" />
        <.avatar variant="solid" color="cyan" fallback="A" />
        <.avatar variant="solid" color="orange" fallback="A" />
        <.avatar variant="solid" color="crimson" fallback="A" />
      </.flex>
  </:heex>
</.demo>

### High-contrast

Use the `high_contrast` prop to increase color contrast with the background.

<.demo>
  <:heex code={~S|<.grid rows="2" gap="2" display="inline-grid" flow="column"><.avatar variant="solid" color="indigo" fallback="A" /><.avatar variant="solid" color="indigo" fallback="A" high_contrast /><.avatar variant="solid" color="cyan" fallback="A" /><.avatar variant="solid" color="cyan" fallback="A" high_contrast /><.avatar variant="solid" color="orange" fallback="A" /><.avatar variant="solid" color="orange" fallback="A" high_contrast /><.avatar variant="solid" color="crimson" fallback="A" /><.avatar variant="solid" color="crimson" fallback="A" high_contrast /><.avatar variant="solid" color="gray" fallback="A" /><.avatar variant="solid" color="gray" fallback="A" high_contrast /></.grid>|}>
      <.grid rows="2" gap="2" display="inline-grid" flow="column">
        <.avatar variant="solid" color="indigo" fallback="A" />
        <.avatar variant="solid" color="indigo" fallback="A" high_contrast />
        <.avatar variant="solid" color="cyan" fallback="A" />
        <.avatar variant="solid" color="cyan" fallback="A" high_contrast />
        <.avatar variant="solid" color="orange" fallback="A" />
        <.avatar variant="solid" color="orange" fallback="A" high_contrast />
        <.avatar variant="solid" color="crimson" fallback="A" />
        <.avatar variant="solid" color="crimson" fallback="A" high_contrast />
        <.avatar variant="solid" color="gray" fallback="A" />
        <.avatar variant="solid" color="gray" fallback="A" high_contrast />
      </.grid>
  </:heex>
</.demo>

### Radius

Use the `radius` prop to assign a specific radius value.

<.demo>
  <:heex code={~S|<.flex gap="2"><.avatar radius="none" fallback="A" /><.avatar radius="large" fallback="A" /><.avatar radius="full" fallback="A" /></.flex>|}>
      <.flex gap="2">
        <.avatar radius="none" fallback="A" />
        <.avatar radius="large" fallback="A" />
        <.avatar radius="full" fallback="A" />
      </.flex>
  </:heex>
</.demo>

### Fallback

Use the `fallback` prop or `fallback_slot` to modify the rendered fallback element.

<.demo>
  <:heex code={~S|<.flex gap="2"><.avatar fallback="A" /><.avatar fallback="AB" /><.avatar><:fallback_slot><.box width="24px" height="24px"><svg viewBox="0 0 64 64" fill="currentColor"><path d="M41.5 14c4.687 0 8.5 4.038 8.5 9s-3.813 9-8.5 9S33 27.962 33 23 36.813 14 41.5 14zM56.289 43.609C57.254 46.21 55.3 49 52.506 49c-2.759 0-11.035 0-11.035 0 .689-5.371-4.525-10.747-8.541-13.03 2.388-1.171 5.149-1.834 8.07-1.834C48.044 34.136 54.187 37.944 56.289 43.609zM37.289 46.609C38.254 49.21 36.3 52 33.506 52c-5.753 0-17.259 0-23.012 0-2.782 0-4.753-2.779-3.783-5.392 2.102-5.665 8.245-9.472 15.289-9.472S35.187 40.944 37.289 46.609zM21.5 17c4.687 0 8.5 4.038 8.5 9s-3.813 9-8.5 9S13 30.962 13 26 16.813 17 21.5 17z" /></svg></.box></:fallback_slot></.avatar></.flex>|}>
      <.flex gap="2">
        <.avatar fallback="A" />
        <.avatar fallback="AB" />
        <.avatar>
          <:fallback_slot>
            <.box width="24px" height="24px">
              <svg viewBox="0 0 64 64" fill="currentColor">
                <path d="M41.5 14c4.687 0 8.5 4.038 8.5 9s-3.813 9-8.5 9S33 27.962 33 23 36.813 14 41.5 14zM56.289 43.609C57.254 46.21 55.3 49 52.506 49c-2.759 0-11.035 0-11.035 0 .689-5.371-4.525-10.747-8.541-13.03 2.388-1.171 5.149-1.834 8.07-1.834C48.044 34.136 54.187 37.944 56.289 43.609zM37.289 46.609C38.254 49.21 36.3 52 33.506 52c-5.753 0-17.259 0-23.012 0-2.782 0-4.753-2.779-3.783-5.392 2.102-5.665 8.245-9.472 15.289-9.472S35.187 40.944 37.289 46.609zM21.5 17c4.687 0 8.5 4.038 8.5 9s-3.813 9-8.5 9S13 30.962 13 26 16.813 17 21.5 17z" />
              </svg>
            </.box>
          </:fallback_slot>
        </.avatar>
      </.flex>
  </:heex>
</.demo>
