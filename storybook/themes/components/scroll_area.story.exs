defmodule Storybook.Themes.Components.ScrollArea do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.DataList
  alias EssenceUI.Components.ScrollArea

  def function, do: &ScrollArea.scroll_area/1

  def imports,
    do: [
      {EssenceUI.Components.Box, box: 1},
      {EssenceUI.Components.Flex, flex: 1},
      {EssenceUI.Components.Text, text: 1},
      {EssenceUI.Components.Heading, heading: 1},
      {DataList, data_list: 1},
      {DataList, data_list_item: 1},
      {EssenceUI.Components.Badge, badge: 1}
    ]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "padding: 40px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :vertical,
        description: "Vertical scroll area",
        template: """
        <.scroll_area style="height: 180px">
          <.box p="4" pr="8">
            <.heading size="4" mb="2" weight="bold">Principles of the design system</.heading>
            <.text as="p" size="2" mb="4">
              The goal of the design system is to create a consistent and cohesive user experience across all of our products.
            </.text>
            <.text as="p" size="2" mb="4">
              It provides a set of reusable components, styles, and guidelines that help designers and developers work together more efficiently.
            </.text>
            <.text as="p" size="2" mb="4">
              By following these principles, we can ensure that our products are accessible, easy to use, and visually appealing.
            </.text>
            <.text as="p" size="2" mb="4">
              Consistency is key. Use the same patterns and components throughout the application to reduce cognitive load for users.
            </.text>
            <.text as="p" size="2">
              Accessibility is not an afterthought. Design with all users in mind from the beginning.
            </.text>
          </.box>
        </.scroll_area>
        """
      },
      %Variation{
        id: :horizontal,
        description: "Horizontal scroll area",
        template: """
        <.scroll_area style="width: 300px">
          <.flex gap="4" p="4" style="width: 600px">
            <%= for i <- 1..10 do %>
              <.box
                style="width: 80px; height: 80px; background-color: var(--accent-a3); border-radius: var(--radius-3); flex-shrink: 0;"
                display="flex"
                align="center"
                justify="center"
              >
                <.text size="2">{i}</.text>
              </.box>
            <% end %>
          </.flex>
        </.scroll_area>
        """
      },
      %Variation{
        id: :dense_data,
        description: "Dense data display with ScrollArea",
        template: """
        <.box
          style="width: 400px; border: 1px solid var(--gray-5); border-radius: var(--radius-4); overflow: hidden;"
        >
          <.scroll_area style="height: 300px">
            <.box p="4">
              <.heading size="3" mb="4">Customer Details</.heading>
              <.data_list size="1">
                <.data_list_item>
                  <:label>Status</:label>
                  <:value><.badge color="green" radius="full">Active</.badge></:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>ID</:label>
                  <:value>USR-7821-X9</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Full Name</:label>
                  <:value>Johnathan Appleseed</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Email</:label>
                  <:value>john.appleseed@example.com</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Phone</:label>
                  <:value>+1 (555) 000-1234</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Company</:label>
                  <:value>Acme Corporation</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Location</:label>
                  <:value>San Francisco, CA</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Joined</:label>
                  <:value>January 12, 2023</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Last Login</:label>
                  <:value>2 hours ago</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Plan</:label>
                  <:value>Enterprise Pro</:value>
                </.data_list_item>
                <.data_list_item>
                  <:label>Support Pin</:label>
                  <:value>8821</:value>
                </.data_list_item>
              </.data_list>
            </.box>
          </.scroll_area>
        </.box>
        """
      }
    ]
  end
end
