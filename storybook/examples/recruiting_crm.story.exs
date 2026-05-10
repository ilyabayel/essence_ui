defmodule Storybook.Examples.RecruitingCrm do
  @moduledoc false
  use PhoenixStorybook.Story, :example
  use Phoenix.Component

  import EssenceUI.Components, except: [quote: 1]
  import EssenceUI.Components.Tabs

  @impl true
  def render(assigns) do
    ~H"""
    <div
      data-scaling="100%"
      data-radius="medium"
      data-gray-color="slate"
      data-accent-color="blue"
      class="essence-ui"
      style="display: flex; height: 100vh; width: 100vw; overflow: hidden; background-color: var(--gray-1);"
    >
      <%!-- Left Sidebar --%>
      <.flex
        direction="column"
        align="center"
        justify="space-between"
        p="4"
        style="width: 64px; border-right: 1px solid var(--gray-4); background-color: var(--gray-2);"
      >
        <.flex direction="column" gap="4" align="center">
          <.icon_button variant="ghost" size="3" color="gray">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
            >
              <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
              <line x1="9" y1="3" x2="9" y2="21"></line>
            </svg>
          </.icon_button>
          <.icon_button variant="soft" size="3">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
            >
              <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
            </svg>
          </.icon_button>
          <.icon_button variant="ghost" size="3" color="gray">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
            >
              <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
              <circle cx="9" cy="7" r="4"></circle>
              <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
              <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
            </svg>
          </.icon_button>
        </.flex>

        <.avatar
          src="https://images.unsplash.com/photo-1502602724662-781c8963e6cc?auto=format&fit=crop&w=128&q=80"
          fallback="JD"
          size="2"
        />
      </.flex>

      <%!-- Main Content Area --%>
      <.flex direction="column" style="flex: 1; overflow: hidden;">
        <%!-- Top Header --%>
        <.flex
          align="center"
          justify="space-between"
          px="6"
          py="4"
          style="border-bottom: 1px solid var(--gray-4); background-color: var(--gray-1);"
        >
          <.flex align="center" gap="4">
            <.heading size="5" weight="bold">Pipeline: Software Engineering</.heading>
            <.badge variant="surface" color="gray">12 Candidates</.badge>
          </.flex>

          <.flex align="center" gap="3">
            <.text_field placeholder="Search candidates..." size="2" style="width: 250px;">
              <:slot side="left">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                >
                  <circle cx="11" cy="11" r="8"></circle>
                  <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
              </:slot>
            </.text_field>

            <.dropdown_menu_root>
              <.dropdown_menu_trigger>
                <.button variant="soft" color="gray">
                  All Stages
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                  >
                    <polyline points="6 9 12 15 18 9"></polyline>
                  </svg>
                </.button>
              </.dropdown_menu_trigger>
              <.dropdown_menu_content>
                <.dropdown_menu_item>Sourced</.dropdown_menu_item>
                <.dropdown_menu_item>Screening</.dropdown_menu_item>
                <.dropdown_menu_item>Interview</.dropdown_menu_item>
                <.dropdown_menu_separator />
                <.dropdown_menu_item color="red">Reset Filters</.dropdown_menu_item>
              </.dropdown_menu_content>
            </.dropdown_menu_root>

            <.button variant="solid">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <line x1="12" y1="5" x2="12" y2="19"></line>
                <line x1="5" y1="12" x2="19" y2="12"></line>
              </svg>
              Add Candidate
            </.button>
          </.flex>
        </.flex>
        <.scroll_area style="flex: 1; padding: 24px;">
          <.flex gap="6" style="min-height: 100%;">
            <%= for {stage, count} <- [{"Sourced", 4}, {"Screening", 3}, {"Interview", 3}, {"Offer", 2}] do %>
              <.flex direction="column" gap="4" style="width: 280px; flex-shrink: 0;">
                <.flex align="center" justify="space-between">
                  <.flex align="center" gap="2">
                    <.heading size="3" weight="bold">{stage}</.heading>
                    <.badge variant="soft" color="gray" size="1">{count}</.badge>
                  </.flex>
                  <.icon_button variant="ghost" size="1" color="gray">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                    >
                      <circle cx="12" cy="12" r="1"></circle>
                      <circle cx="12" cy="5" r="1"></circle>
                      <circle cx="12" cy="19" r="1"></circle>
                    </svg>
                  </.icon_button>
                </.flex>

                <%!-- Card list area --%>
                <.flex
                  direction="column"
                  gap="3"
                  style="flex: 1; min-height: 200px; background-color: var(--gray-3); padding: 8px; border-radius: var(--radius-4);"
                >
                  <%= if stage == "Sourced" do %>
                    <.candidate_card
                      name="Alice Johnson"
                      role="Fullstack Engineer"
                      src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=64&q=80"
                      fallback="AJ"
                      tags={["React", "Elixir"]}
                    />
                    <.candidate_card
                      name="Bob Smith"
                      role="Backend Lead"
                      src={nil}
                      fallback="BS"
                      tags={["Go", "Kubernetes"]}
                    />
                  <% end %>
                  <%= if stage == "Screening" do %>
                    <.candidate_card
                      name="Charlie Brown"
                      role="UX Designer"
                      src={nil}
                      fallback="CB"
                      tags={["Figma", "Design Systems"]}
                    />
                  <% end %>
                  <%= if stage == "Interview" do %>
                    <.candidate_card
                      name="David Wilson"
                      role="Product Manager"
                      src={nil}
                      fallback="DW"
                      tags={["Agile", "Roadmap"]}
                    />
                  <% end %>
                </.flex>
              </.flex>
            <% end %>
          </.flex>
        </.scroll_area>

        <.dialog id="candidate-detail" target="body" default_state="closed">
          <.flex
            direction="column"
            gap="4"
            p="6"
            style="max-width: 600px; background-color: var(--gray-1); border-radius: var(--radius-4);"
          >
            <.flex justify="space-between" align="center">
              <.flex gap="4" align="center">
                <.avatar
                  size="4"
                  src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=128&q=80"
                  fallback="AJ"
                />
                <.flex direction="column">
                  <.heading size="6">Alice Johnson</.heading>
                  <.text color="gray">Senior Fullstack Engineer</.text>
                </.flex>
              </.flex>
              <.badge size="3" variant="soft">Sourced</.badge>
            </.flex>

            <.tabs default_value="overview">
              <:list :let={ctx}>
                <.tabs_list size="2" tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
                  <:trigger value="overview">Overview</:trigger>
                  <:trigger value="evaluation">Evaluation</:trigger>
                  <:trigger value="notes">Notes</:trigger>
                  <:trigger value="settings">Settings</:trigger>
                </.tabs_list>
              </:list>

              <:content value="overview">
                <.flex direction="column" gap="4" mt="4">
                  <.grid columns="2" gap="4">
                    <.flex direction="column" gap="1">
                      <.text size="2" weight="bold">Email</.text>
                      <.text_field value="alice.j@example.com" />
                    </.flex>
                    <.flex direction="column" gap="1">
                      <.text size="2" weight="bold">Phone</.text>
                      <.text_field value="+1 (555) 000-0000" />
                    </.flex>
                  </.grid>
                  <.flex direction="column" gap="1">
                    <.text size="2" weight="bold">Source</.text>
                    <.select placeholder="Select source..." value="LinkedIn">
                      <:option value="LinkedIn" selected>LinkedIn</:option>
                      <:option value="Referral">Referral</:option>
                    </.select>
                  </.flex>
                </.flex>
              </:content>

              <:content value="evaluation">
                <.flex direction="column" gap="5" mt="4">
                  <.flex direction="column" gap="2">
                    <.text size="2" weight="bold">Technical Skill Score</.text>
                    <.slider default_value={[80]} />
                  </.flex>

                  <.flex direction="column" gap="2">
                    <.text size="2" weight="bold">Recommendation</.text>
                    <.radio_group name="recommendation" default_value="hire">
                      <:item value="hire">Strong Hire</:item>
                      <:item value="hold">Hold</:item>
                      <:item value="no">No Hire</:item>
                    </.radio_group>
                  </.flex>

                  <.flex direction="column" gap="2">
                    <.text size="2" weight="bold">Verified Skills</.text>
                    <.checkbox_group name="skills" default_value={["elixir", "react"]}>
                      <:item value="elixir">Elixir</:item>
                      <:item value="react">React</:item>
                      <:item value="db">PostgreSQL</:item>
                    </.checkbox_group>
                  </.flex>
                </.flex>
              </:content>

              <:content value="notes">
                <.flex direction="column" gap="3" mt="4">
                  <.text_area placeholder="Add private feedback notes..." style="height: 150px;" />
                  <.button variant="solid">Save Note</.button>
                </.flex>
              </:content>

              <:content value="settings">
                <.flex direction="column" gap="4" mt="4">
                  <.flex justify="space-between" align="center">
                    <.flex direction="column">
                      <.strong size="2">Email Notifications</.strong>
                      <.text size="1" color="gray">Receive updates on candidate progress</.text>
                    </.flex>
                    <.switch default_checked />
                  </.flex>
                  <.separator size="4" />
                  <.button variant="soft" color="red" style="width: 100%;">Archive Candidate</.button>
                </.flex>
              </:content>
            </.tabs>
          </.flex>
        </.dialog>
      </.flex>
    </div>
    """
  end

  defp candidate_card(assigns) do
    ~H"""
    <.context_menu_root>
      <.context_menu_trigger>
        <.card
          p="3"
          style="cursor: pointer; transition: transform 0.1s; border: 1px solid var(--gray-4);"
          class="hover-lift"
        >
          <.flex direction="column" gap="3">
            <.flex justify="space-between" align="start">
              <.flex gap="3" align="center">
                <.avatar size="1" src={@src} fallback={@fallback} />
                <.flex direction="column">
                  <.strong size="2">{@name}</.strong>
                  <.text size="1" color="gray">{@role}</.text>
                </.flex>
              </.flex>
              <.hover_card_root>
                <.hover_card_trigger>
                  <.icon_button variant="ghost" size="1" color="gray">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="14"
                      height="14"
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                    >
                      <circle cx="12" cy="12" r="10"></circle>
                      <line x1="12" y1="16" x2="12" y2="12"></line>
                      <line x1="12" y1="8" x2="12.01" y2="8"></line>
                    </svg>
                  </.icon_button>
                </.hover_card_trigger>
                <.hover_card_content>
                  <.flex
                    direction="column"
                    gap="2"
                    p="3"
                    style="background-color: var(--gray-1); border: 1px solid var(--gray-4); border-radius: var(--radius-2); box-shadow: var(--shadow-3);"
                  >
                    <.strong size="2">Last Activity</.strong>
                    <.text size="1">Updated status to {@name} 2 days ago.</.text>
                  </.flex>
                </.hover_card_content>
              </.hover_card_root>
            </.flex>

            <.flex gap="2" wrap="wrap">
              <%= for tag <- @tags do %>
                <.badge variant="surface" size="1" color="blue">{tag}</.badge>
              <% end %>
            </.flex>
          </.flex>
        </.card>
      </.context_menu_trigger>
      <.context_menu_content>
        <.context_menu_item>View Profile</.context_menu_item>
        <.context_menu_item>Move Stage</.context_menu_item>
        <.context_menu_separator />
        <.context_menu_item color="red">Archive</.context_menu_item>
      </.context_menu_content>
    </.context_menu_root>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
