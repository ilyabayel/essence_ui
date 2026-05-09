defmodule Storybook.Examples.DenseDisplayStory do
  @moduledoc false
  use PhoenixStorybook.Story, :example
  use Phoenix.Component

  import EssenceUI.Components, except: [quote: 1]

  @impl true
  def render(assigns) do
    ~H"""
    <div
      data-scaling="100%"
      data-radius="medium"
      style="display: block; min-height: 100vh; padding: 20px;"
      data-gray-color="slate"
      data-accent-color="indigo"
      class="essence-ui"
    >
      <.grid columns={%{initial: "1", md: "2"}} gap="6">
        <%!-- Account Information (Dense DataList) --%>
        <.card p="4">
          <.flex direction="column" gap="3">
            <.heading size="4" mb="2">Account Information</.heading>
            <.data_list size="1">
              <.data_list_item>
                <:label>Full Name</:label>
                <:value>John Doe</:value>
              </.data_list_item>
              <.data_list_item>
                <:label>Email</:label>
                <:value>vlad@example.com</:value>
              </.data_list_item>
              <.data_list_item>
                <:label>Company</:label>
                <:value>WorkOS</:value>
              </.data_list_item>
              <.data_list_item>
                <:label>Role</:label>
                <:value>Software Engineer</:value>
              </.data_list_item>
              <.data_list_item>
                <:label>Location</:label>
                <:value>New York, NY</:value>
              </.data_list_item>
            </.data_list>
          </.flex>
        </.card>

        <%!-- Recent Logs (ScrollArea) --%>
        <.card p="0" style="overflow: hidden;">
          <.box p="4" style="border-bottom: 1px solid var(--gray-5)">
            <.heading size="4">System Logs</.heading>
          </.box>
          <.scroll_area style="height: 200px">
            <.box p="4">
              <%= for i <- 1..20 do %>
                <.flex gap="2" mb="2" align="center">
                  <.text size="1" color="gray" style="font-family: monospace; white-space: nowrap;">
                    [2026-05-09 15:52:{10 + i}]
                  </.text>
                  <.badge size="1" color={if rem(i, 5) == 0, do: "red", else: "blue"}>
                    {if rem(i, 5) == 0, do: "ERROR", else: "INFO"}
                  </.badge>
                  <.text size="1">Event {i} processed successfully.</.text>
                </.flex>
              <% end %>
            </.box>
          </.scroll_area>
        </.card>

        <%!-- Compact Table --%>
        <.card p="0" style="overflow: hidden; grid-column: span 2">
          <.box p="4" style="border-bottom: 1px solid var(--gray-5)">
            <.heading size="4">Active Projects</.heading>
          </.box>
          <.table size="1">
            <.table_header>
              <.table_row>
                <.table_column_header_cell>Project</.table_column_header_cell>
                <.table_column_header_cell>Status</.table_column_header_cell>
                <.table_column_header_cell>Lead</.table_column_header_cell>
                <.table_column_header_cell>Priority</.table_column_header_cell>
              </.table_row>
            </.table_header>
            <.table_body>
              <%= for project <- ["Essence UI", "Phoenix Components", "Radix Elixir", "LiveView Hooks"] do %>
                <.table_row>
                  <.table_row_header_cell>{project}</.table_row_header_cell>
                  <.table_cell>
                    <.badge size="1" variant="soft" color="jade" radius="full">Active</.badge>
                  </.table_cell>
                  <.table_cell>Vlad E.</.table_cell>
                  <.table_cell>
                    <.text color="gray" size="1">High</.text>
                  </.table_cell>
                </.table_row>
              <% end %>
            </.table_body>
          </.table>
        </.card>
      </.grid>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
