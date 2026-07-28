---
title: Data List
description: Displays metadata as a list of key-value pairs.
---

<.demo>
  <:heex code={~S|<.data_list><.data_list_item align="center"><:label>Status</:label><:value><.badge color="jade" variant="soft" radius="full">Authorized</.badge></:value></.data_list_item><.data_list_item><:label>ID</:label><:value><.code variant="ghost">u_2J89JSA4GJ</.code></:value></.data_list_item><.data_list_item><:label>Name</:label><:value>Vlad Moroz</:value></.data_list_item><.data_list_item><:label>Email</:label><:value><.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link></:value></.data_list_item><.data_list_item><:label>Company</:label><:value><.es_link href="https://workos.com" target="_blank">WorkOS</.es_link></:value></.data_list_item></.data_list>|}>
      <.data_list>
        <.data_list_item align="center">
          <:label>Status</:label>
          <:value>
            <.badge color="jade" variant="soft" radius="full">Authorized</.badge>
          </:value>
        </.data_list_item>
        <.data_list_item>
          <:label>ID</:label>
          <:value><.code variant="ghost">u_2J89JSA4GJ</.code></:value>
        </.data_list_item>
        <.data_list_item>
          <:label>Name</:label>
          <:value>Vlad Moroz</:value>
        </.data_list_item>
        <.data_list_item>
          <:label>Email</:label>
          <:value>
            <.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link>
          </:value>
        </.data_list_item>
        <.data_list_item>
          <:label>Company</:label>
          <:value>
            <.es_link href="https://workos.com" target="_blank">WorkOS</.es_link>
          </:value>
        </.data_list_item>
      </.data_list>
  </:heex>
</.demo>

## API Reference

This component is based on the `dl` element and supports common margin props. Label and value are `:label` and `:value` slots on `data_list_item/1` — there are no separate Label or Value components.

### Root

Contains all the parts of the data list.

<.props_table module={EssenceUI.Components.DataList} function={:data_list} />

### Item

Wraps a key-value pair.

<.props_table module={EssenceUI.Components.DataList} function={:data_list_item} />

## Examples

### Orientation

Use the `orientation` prop to change the way the data list is laid out.

<.demo>
  <:heex code={~S|<.data_list orientation="vertical"><.data_list_item><:label>Name</:label><:value>Vlad Moroz</:value></.data_list_item><.data_list_item><:label>Email</:label><:value><.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link></:value></.data_list_item><.data_list_item><:label>Company</:label><:value><.es_link href="https://workos.com" target="_blank">WorkOS</.es_link></:value></.data_list_item></.data_list>|}>
      <.data_list orientation="vertical">
        <.data_list_item>
          <:label>Name</:label>
          <:value>Vlad Moroz</:value>
        </.data_list_item>
        <.data_list_item>
          <:label>Email</:label>
          <:value>
            <.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link>
          </:value>
        </.data_list_item>
        <.data_list_item>
          <:label>Company</:label>
          <:value>
            <.es_link href="https://workos.com" target="_blank">WorkOS</.es_link>
          </:value>
        </.data_list_item>
      </.data_list>
  </:heex>
</.demo>

### Size

Use the `size` prop to change the size of the data list.

<.demo>
  <:heex code={~S|<.flex direction="column" gap="6"><.data_list size="1"><.data_list_item><:label>Name</:label><:value>Vlad Moroz</:value></.data_list_item><.data_list_item><:label>Email</:label><:value><.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link></:value></.data_list_item></.data_list><.data_list size="2"><.data_list_item><:label>Name</:label><:value>Vlad Moroz</:value></.data_list_item><.data_list_item><:label>Email</:label><:value><.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link></:value></.data_list_item></.data_list><.data_list size="3"><.data_list_item><:label>Name</:label><:value>Vlad Moroz</:value></.data_list_item><.data_list_item><:label>Email</:label><:value><.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link></:value></.data_list_item></.data_list></.flex>|}>
      <.flex direction="column" gap="6">
        <.data_list size="1">
          <.data_list_item>
            <:label>Name</:label>
            <:value>Vlad Moroz</:value>
          </.data_list_item>
          <.data_list_item>
            <:label>Email</:label>
            <:value>
              <.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link>
            </:value>
          </.data_list_item>
        </.data_list>
        <.data_list size="2">
          <.data_list_item>
            <:label>Name</:label>
            <:value>Vlad Moroz</:value>
          </.data_list_item>
          <.data_list_item>
            <:label>Email</:label>
            <:value>
              <.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link>
            </:value>
          </.data_list_item>
        </.data_list>
        <.data_list size="3">
          <.data_list_item>
            <:label>Name</:label>
            <:value>Vlad Moroz</:value>
          </.data_list_item>
          <.data_list_item>
            <:label>Email</:label>
            <:value>
              <.es_link href="mailto:vlad@workos.com">vlad@workos.com</.es_link>
            </:value>
          </.data_list_item>
        </.data_list>
      </.flex>
  </:heex>
</.demo>
