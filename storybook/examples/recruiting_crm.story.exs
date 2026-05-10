defmodule Storybook.Examples.RecruitingCRMStory do
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
      data-gray-color="slate"
      data-accent-color="blue"
      class="essence-ui"
      style="display: flex; height: 100vh; width: 100vw; overflow: hidden; background-color: var(--gray-1);"
    >
      <%!-- Left Sidebar --%>
      <.flex
        direction="column"
        align="center"
        justify="between"
        p="4"
        style="width: 64px; border-right: 1px solid var(--gray-4); background-color: var(--gray-2);"
      >
        <.flex direction="column" gap="4" align="center">
          <.icon_button variant="ghost" size="3" color="gray">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="9" y1="3" x2="9" y2="21"></line></svg>
          </.icon_button>
          <.icon_button variant="soft" size="3">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline></svg>
          </.icon_button>
          <.icon_button variant="ghost" size="3" color="gray">
             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
          </.icon_button>
        </.flex>
        
        <.avatar src="https://images.unsplash.com/photo-1502602724662-781c8963e6cc?auto=format&fit=crop&w=128&q=80" fallback="JD" size="2" />
      </.flex>

      <%!-- Main Content Area --%>
      <.flex direction="column" style="flex: 1; overflow: hidden;">
        <%!-- Top Header --%>
        <.flex align="center" justify="between" px="6" py="4" style="border-bottom: 1px solid var(--gray-4); background-color: var(--gray-1);">
          <.flex align="center" gap="4">
            <.heading size="5" weight="bold">Pipeline: Software Engineering</.heading>
            <.badge variant="surface" color="gray">12 Candidates</.badge>
          </.flex>
          
          <.flex align="center" gap="3">
            <.text_field placeholder="Search candidates..." size="2" style="width: 250px;">
              <:slot_left>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
              </:slot_left>
            </.text_field>
            
            <.dropdown_menu>
              <:trigger>
                <.button variant="soft" color="gray">
                  All Stages
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"></polyline></svg>
                </.button>
              </:trigger>
              <.dropdown_menu_item>Sourced</.dropdown_menu_item>
              <.dropdown_menu_item>Screening</.dropdown_menu_item>
              <.dropdown_menu_item>Interview</.dropdown_menu_item>
              <.dropdown_menu_separator />
              <.dropdown_menu_item color="red">Reset Filters</.dropdown_menu_item>
            </.dropdown_menu>
            
            <.button variant="solid">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
              Add Candidate
            </.button>
          </.flex>
        </.flex>
        <div id="kanban-board" style="flex: 1; overflow: auto;"></div>
      </.flex>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
