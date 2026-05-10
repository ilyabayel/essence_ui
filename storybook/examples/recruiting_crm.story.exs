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
        <%!-- Content will be added in subsequent tasks --%>
        <div id="main-header"></div>
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
