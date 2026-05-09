defmodule Storybook.Components.DataList do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.DataList

  def function, do: &DataList.data_list/1

  def imports,
    do: [
      {EssenceUI.Components.Badge, badge: 1},
      {EssenceUI.Components.Code, code: 1},
      {EssenceUI.Components.Flex, flex: 1},
      {EssenceUI.Components.IconButton, icon_button: 1},
      {EssenceUI.Components.Link, link: 1},
      {EssenceUI.Components.Text, text: 1},
      {DataList, data_list_item: 1}
    ]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 32px; padding: 40px; max-width: 600px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Basic data list",
        template: """
        <.data_list>
          <.data_list_item>
            <:label>Status</:label>
            <:value>
              <.badge color="jade" variant="soft" radius="full">
                Active
              </.badge>
            </:value>
          </.data_list_item>
          <.data_list_item>
            <:label>ID</:label>
            <:value>
              <.code variant="ghost">642220-4100</.code>
              <.icon_button
                variant="ghost"
                color="gray"
                size="1"
                aria-label="Copy ID"
                style="margin-left: 4px"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-4 h-4"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M15.75 17.25v3.375c0 .621-.504 1.125-1.125 1.125h-9.75a1.125 1.125 0 0 1-1.125-1.125V7.875c0-.621.504-1.125 1.125-1.125H6.75a9.06 9.06 0 0 1 1.5-1.5h6.25c.621 0 1.125.504 1.125 1.125v3.375m7.5 0.375V19.5a1.125 1.125 0 0 1-1.125 1.125H11.25A1.125 1.125 0 0 1 10.125 19.5V11.25c0-.621.504-1.125 1.125-1.125h9.75c.621 0 1.125.504 1.125 1.125Z"
                  />
                </svg>
              </.icon_button>
            </:value>
          </.data_list_item>
          <.data_list_item>
            <:label>Full name</:label>
            <:value>John Doe</:value>
          </.data_list_item>
          <.data_list_item>
            <:label>Email</:label>
            <:value>
              <.link href="mailto:john@example.com">john@example.com</.link>
            </:value>
          </.data_list_item>
          <.data_list_item>
            <:label>Company</:label>
            <:value>
              <.link href="https://workos.com" target="_blank">WorkOS</.link>
            </:value>
          </.data_list_item>
        </.data_list>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different sizes",
        template: """
        <div style="display: flex; flex-direction: column; gap: 40px;">
          <.data_list size="1">
            <.data_list_item>
              <:label>Size 1</:label>
              <:value>This is a size 1 data list.</:value>
            </.data_list_item>
          </.data_list>

          <.data_list size="2">
            <.data_list_item>
              <:label>Size 2</:label>
              <:value>This is a size 2 data list.</:value>
            </.data_list_item>
          </.data_list>

          <.data_list size="3">
            <.data_list_item>
              <:label>Size 3</:label>
              <:value>This is a size 3 data list.</:value>
            </.data_list_item>
          </.data_list>
        </div>
        """
      },
      %Variation{
        id: :vertical,
        description: "Vertical orientation",
        template: """
        <.data_list orientation="vertical">
          <.data_list_item>
            <:label>Label</:label>
            <:value>Value</:value>
          </.data_list_item>
          <.data_list_item>
            <:label>Another Label</:label>
            <:value>Another Value</:value>
          </.data_list_item>
        </.data_list>
        """
      },
      %Variation{
        id: :alignment,
        description: "Different item alignment",
        template: """
        <.data_list>
          <.data_list_item align="center">
            <:label>Centered</:label>
            <:value>
              <.badge>Aligned to center</.badge>
            </:value>
          </.data_list_item>
          <.data_list_item align="start">
            <:label>Start</:label>
            <:value>
              <.text>
                This value is aligned to the start.
                It has multiple lines to show the alignment clearly.
              </.text>
            </:value>
          </.data_list_item>
        </.data_list>
        """
      }
    ]
  end
end
