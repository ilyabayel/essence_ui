defmodule Storybook.Components.Popover do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Popover

  def function, do: &Popover.popover_root/1

  def imports,
    do: [
      {EssenceUI.Components.Avatar, avatar: 1},
      {EssenceUI.Components.Box, box: 1},
      {EssenceUI.Components.Flex, flex: 1},
      {EssenceUI.Components.Heading, heading: 1},
      {EssenceUI.Components.Text, text: 1},
      {EssenceUI.Components.Button, button: 1},
      {EssenceUI.Components.TextArea, text_area: 1},
      {EssenceUI.Components.Checkbox, checkbox: 1},
      {EssenceUI.Components.Grid, grid: 1},
      {Popover, popover_trigger: 1},
      {Popover, popover_content: 1},
      {Popover, popover_close: 1}
    ]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px; padding: 80px 40px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Basic popover with a button trigger",
        template: """
        <.popover_root>
          <.popover_trigger>
            <.button variant="soft">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                <path stroke-linecap="round" stroke-linejoin="round" d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z" />
              </svg>
              Comment
            </.button>
          </.popover_trigger>
          <.popover_content width="360px">
            <.flex gap="3">
              <.avatar
                size="2"
                src="https://images.unsplash.com/photo-1502685104226-ee32379fefbe?&w=64&h=64&dpr=2&q=70&crop=focalpoint&fp-x=0.5&fp-y=0.3&fp-z=1&fit=crop"
                fallback="A"
                radius="full"
              />
              <.box grow="1">
                <.text_area placeholder="Write a comment…" style="height: 80px" />
                <.flex gap="3" mt="3" justify="space-between">
                  <.flex align="center" gap="2" as="label">
                    <.checkbox default_checked />
                    <.text size="2">Send to group</.text>
                  </.flex>
                  <.popover_close>
                    <.button size="1">Comment</.button>
                  </.popover_close>
                </.flex>
              </.box>
            </.flex>
          </.popover_content>
        </.popover_root>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different popover sizes",
        template: """
        <.flex gap="3">
          <.popover_root>
            <.popover_trigger>
              <.button variant="soft">Size 1</.button>
            </.popover_trigger>
            <.popover_content size="1">
              <.text size="1">This is a size 1 popover.</.text>
            </.popover_content>
          </.popover_root>

          <.popover_root>
            <.popover_trigger>
              <.button variant="soft">Size 2</.button>
            </.popover_trigger>
            <.popover_content size="2">
              <.text size="2">This is a size 2 popover.</.text>
            </.popover_content>
          </.popover_root>

          <.popover_root>
            <.popover_trigger>
              <.button variant="soft">Size 3</.button>
            </.popover_trigger>
            <.popover_content size="3">
              <.text size="3">This is a size 3 popover.</.text>
            </.popover_content>
          </.popover_root>
        </.flex>
        """
      },
      %Variation{
        id: :side_align,
        description: "Different side and alignment variations",
        template: """
        <.grid columns="3" gap="3">
          <.popover_root>
            <.popover_trigger>
              <.button variant="outline" style="width: 100%">Top Start</.button>
            </.popover_trigger>
            <.popover_content side="top" align="start">
              <.text size="2">Top Start</.text>
            </.popover_content>
          </.popover_root>

          <.popover_root>
            <.popover_trigger>
              <.button variant="outline" style="width: 100%">Top Center</.button>
            </.popover_trigger>
            <.popover_content side="top" align="center">
              <.text size="2">Top Center</.text>
            </.popover_content>
          </.popover_root>

          <.popover_root>
            <.popover_trigger>
              <.button variant="outline" style="width: 100%">Top End</.button>
            </.popover_trigger>
            <.popover_content side="top" align="end">
              <.text size="2">Top End</.text>
            </.popover_content>
          </.popover_root>

          <.popover_root>
            <.popover_trigger>
              <.button variant="outline" style="width: 100%">Right Start</.button>
            </.popover_trigger>
            <.popover_content side="right" align="start">
              <.text size="2">Right Start</.text>
            </.popover_content>
          </.popover_root>

          <.popover_root>
            <.popover_trigger>
              <.button variant="outline" style="width: 100%">Right Center</.button>
            </.popover_trigger>
            <.popover_content side="right" align="center">
              <.text size="2">Right Center</.text>
            </.popover_content>
          </.popover_root>

          <.popover_root>
            <.popover_trigger>
              <.button variant="outline" style="width: 100%">Right End</.button>
            </.popover_trigger>
            <.popover_content side="right" align="end">
              <.text size="2">Right End</.text>
            </.popover_content>
          </.popover_root>
        </.grid>
        """
      }
    ]
  end
end
