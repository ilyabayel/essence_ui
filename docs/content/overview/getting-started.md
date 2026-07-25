---
title: Getting started
description: Install Essence UI and render your first themed components.
---

EssenceUI is a pre-styled component library for Phoenix LiveView, compatible with [Radix UI Themes](https://www.radix-ui.com/themes).

## 1. Install

Add `:essence_ui` to your `mix.exs` dependencies, then run `mix deps.get`.

<.code_block language="elixir" code={~s[{:essence_ui, "~> 0.1.0"}]} />

## 2. Import CSS

Import Essence UI styles in your app CSS entrypoint:

<.code_block language="css" code={~s[@import "essence-ui/styles.css";]} />

## 3. Theme root

Wrap your layout (or page root) with theme data attributes:

<.code_block
  language="heex"
  code={
    ~S"""
    <main
      class="essence-ui"
      data-accent-color="indigo"
      data-gray-color="slate"
      data-radius="medium"
      data-scaling="100%"
    >
      {@inner_content}
    </main>
    """
  }
/>

## 4. Start building

Import components and compose:

<.demo heex={~S"""
<.flex gap="3" align="center">
  <.text size="3">Hello from Essence UI</.text>
  <.button>Get started</.button>
</.flex>
"""}>
  <.flex gap="3" align="center">
    <.text size="3">Hello from Essence UI</.text>
    <.button>Get started</.button>
  </.flex>
</.demo>

Next: browse [Button](/docs/components/button) or the headless [Dialog](/docs/primitives/dialog) primitive.
