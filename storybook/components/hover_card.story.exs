defmodule Storybook.Components.HoverCard do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.HoverCard

  def function, do: &HoverCard.hover_card_root/1

  def imports,
    do: [
      {EssenceUI.Components.Avatar, avatar: 1},
      {EssenceUI.Components.Box, box: 1},
      {EssenceUI.Components.Flex, flex: 1},
      {EssenceUI.Components.Heading, heading: 1},
      {EssenceUI.Components.Text, text: 1},
      {HoverCard, hover_card_trigger: 1},
      {HoverCard, hover_card_content: 1}
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
        description: "Basic hover card with user profile preview",
        template: """
        <.hover_card_root>
          <.hover_card_trigger>
            <a href="#" class="rt-Link rt-reset rt-Text">@radix_ui</a>
          </.hover_card_trigger>
          <.hover_card_content max_width="300px">
            <.flex gap="4">
              <.avatar
                size="3"
                fallback="R"
                radius="full"
                src="https://pbs.twimg.com/profile_images/1337055608613253126/r_eiMp2H_400x400.png"
              />
              <.box>
                <.heading size="3" as="h3">Radix</.heading>
                <.text as="div" size="2" color="gray" mb="2">@radix_ui</.text>
                <.text as="div" size="2">
                  React components, icons, and colors for building high-quality, accessible UI.
                </.text>
              </.box>
            </.flex>
          </.hover_card_content>
        </.hover_card_root>
        """
      },
      %Variation{
        id: :size_1,
        description: "Size 1 hover card",
        template: """
        <.hover_card_root>
          <.hover_card_trigger>
            <a href="#" class="rt-Link rt-reset rt-Text">Size 1</a>
          </.hover_card_trigger>
          <.hover_card_content size="1" max_width="240px">
            <.text as="div" size="1">
              <strong>Typography</strong> is the art and technique of arranging type to make
              written language legible, readable and appealing when displayed.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
        """
      },
      %Variation{
        id: :size_2,
        description: "Size 2 hover card (default)",
        template: """
        <.hover_card_root>
          <.hover_card_trigger>
            <a href="#" class="rt-Link rt-reset rt-Text">Size 2</a>
          </.hover_card_trigger>
          <.hover_card_content size="2" max_width="280px">
            <.text as="div" size="2">
              <strong>Typography</strong> is the art and technique of arranging type to make
              written language legible, readable and appealing when displayed.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
        """
      },
      %Variation{
        id: :size_3,
        description: "Size 3 hover card",
        template: """
        <.hover_card_root>
          <.hover_card_trigger>
            <a href="#" class="rt-Link rt-reset rt-Text">Size 3</a>
          </.hover_card_trigger>
          <.hover_card_content size="3" max_width="320px">
            <.text as="div" size="3">
              <strong>Typography</strong> is the art and technique of arranging type to make
              written language legible, readable and appealing when displayed.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
        """
      },
      %Variation{
        id: :custom_delays,
        description: "Custom open and close delays",
        template: """
        <.hover_card_root open_delay={500} close_delay={300}>
          <.hover_card_trigger>
            <a href="#" class="rt-Link rt-reset rt-Text">Slow open (500ms)</a>
          </.hover_card_trigger>
          <.hover_card_content max_width="280px">
            <.text as="div" size="2">
              This hover card opens after 500ms and closes after 300ms.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
        """
      },
      %Variation{
        id: :side_top,
        description: "Opens above the trigger",
        template: """
        <.hover_card_root>
          <.hover_card_trigger>
            <a href="#" class="rt-Link rt-reset rt-Text">Open above</a>
          </.hover_card_trigger>
          <.hover_card_content side="top" max_width="280px">
            <.text as="div" size="2">
              This hover card opens above the trigger element.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
        """
      },
      %Variation{
        id: :align_center,
        description: "Center-aligned hover card",
        template: """
        <.hover_card_root>
          <.hover_card_trigger>
            <a href="#" class="rt-Link rt-reset rt-Text">Center aligned</a>
          </.hover_card_trigger>
          <.hover_card_content align="center" max_width="280px">
            <.text as="div" size="2">
              This hover card is center-aligned relative to the trigger.
            </.text>
          </.hover_card_content>
        </.hover_card_root>
        """
      }
    ]
  end
end
