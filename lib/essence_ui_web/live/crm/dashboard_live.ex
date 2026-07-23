defmodule EssenceUIWeb.CRM.DashboardLive do
  @moduledoc false
  use EssenceUIWeb, :live_view

  import EssenceUI.Components, except: [quote: 1]

  @impl true
  def mount(_params, _session, socket) do
    candidates = [
      %{
        id: "1",
        name: "Alice Johnson",
        role: "Fullstack Engineer",
        stage: "Sourced",
        src: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=64&q=80",
        tags: ["React", "Elixir"]
      },
      %{
        id: "2",
        name: "Bob Smith",
        role: "Backend Lead",
        stage: "Sourced",
        src: nil,
        tags: ["Go", "Kubernetes"]
      },
      %{
        id: "3",
        name: "Charlie Brown",
        role: "UX Designer",
        stage: "Screening",
        src: nil,
        tags: ["Figma", "Design Systems"]
      },
      %{
        id: "4",
        name: "David Wilson",
        role: "Product Manager",
        stage: "Interview",
        src: nil,
        tags: ["Agile", "Roadmap"]
      },
      %{
        id: "5",
        name: "Eve Adams",
        role: "Frontend Dev",
        stage: "Interview",
        src: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=64&q=80",
        tags: ["Vue", "Tailwind"]
      },
      %{
        id: "6",
        name: "Frank Miller",
        role: "DevOps Engineer",
        stage: "Offer",
        src: nil,
        tags: ["AWS", "Terraform"]
      }
    ]

    {:ok,
     assign(socket,
       candidates: candidates,
       filtered_candidates: candidates,
       search_query: "",
       current_page: "pipeline",
       selected_candidate: nil,
       stages: ["Sourced", "Screening", "Interview", "Offer"]
     )}
  end

  @impl true
  def handle_event("search", %{"value" => query}, socket) do
    filtered =
      Enum.filter(socket.assigns.candidates, fn c ->
        String.contains?(String.downcase(c.name), String.downcase(query)) or
          String.contains?(String.downcase(c.role), String.downcase(query))
      end)

    {:noreply, assign(socket, search_query: query, filtered_candidates: filtered)}
  end

  @impl true
  def handle_event("select-candidate", %{"id" => id}, socket) do
    candidate = Enum.find(socket.assigns.candidates, &(&1.id == id))
    {:noreply, assign(socket, selected_candidate: candidate)}
  end

  @impl true
  def handle_event("move-candidate", %{"id" => id, "stage" => stage}, socket) do
    candidates =
      Enum.map(socket.assigns.candidates, fn c ->
        if c.id == id, do: %{c | stage: stage}, else: c
      end)

    socket =
      socket
      |> assign(candidates: candidates)
      |> update_filtered()

    selected =
      if socket.assigns.selected_candidate && socket.assigns.selected_candidate.id == id do
        Enum.find(candidates, &(&1.id == id))
      else
        socket.assigns.selected_candidate
      end

    {:noreply, assign(socket, selected_candidate: selected)}
  end

  @impl true
  def handle_event("navigate", %{"page" => page}, socket) do
    {:noreply, assign(socket, current_page: page)}
  end

  @impl true
  def handle_event("close-modal", _params, socket) do
    {:noreply, assign(socket, selected_candidate: nil)}
  end

  defp update_filtered(socket) do
    query = socket.assigns.search_query

    filtered =
      Enum.filter(socket.assigns.candidates, fn c ->
        String.contains?(String.downcase(c.name), String.downcase(query)) or
          String.contains?(String.downcase(c.role), String.downcase(query))
      end)

    assign(socket, filtered_candidates: filtered)
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div
      data-scaling="100%"
      data-radius="medium"
      data-gray-color="slate"
      data-accent-color="blue"
      data-is-root-theme="true"
      class="essence-ui"
      style="display: flex; height: 100vh; width: 100vw; overflow: hidden; background-color: var(--gray-1);"
    >
      <%!-- Left Sidebar --%>
      <.flex
        direction="column"
        align="center"
        justify="space-between"
        p="4"
        style="width: 64px; border-right: 1px solid var(--gray-4); background-color: var(--gray-2); flex-shrink: 0;"
      >
        <.flex direction="column" gap="4" align="center">
          <.icon_button
            variant={if @current_page == "dashboard", do: "soft", else: "ghost"}
            size="3"
            color={if @current_page == "dashboard", do: "blue", else: "gray"}
            phx-click="navigate"
            phx-value-page="dashboard"
          >
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
          <.icon_button
            variant={if @current_page == "pipeline", do: "soft", else: "ghost"}
            size="3"
            color={if @current_page == "pipeline", do: "blue", else: "gray"}
            phx-click="navigate"
            phx-value-page="pipeline"
          >
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
          <.icon_button
            variant={if @current_page == "candidates", do: "soft", else: "ghost"}
            size="3"
            color={if @current_page == "candidates", do: "blue", else: "gray"}
            phx-click="navigate"
            phx-value-page="candidates"
          >
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
      <.flex direction="column" style="flex: 1; min-width: 0; overflow: hidden;">
        <%!-- Top Header --%>
        <.flex
          align="center"
          justify="space-between"
          px="6"
          py="4"
          style="border-bottom: 1px solid var(--gray-4); background-color: var(--gray-1); flex-shrink: 0;"
        >
          <.flex align="center" gap="4">
            <.heading size="5" weight="bold">Pipeline: Software Engineering</.heading>
            <.badge variant="surface" color="gray">{length(@filtered_candidates)} Candidates</.badge>
          </.flex>

          <.flex align="center" gap="3">
            <.text_field
              placeholder="Search candidates..."
              size="2"
              style="width: 250px;"
              value={@search_query}
              phx-keyup="search"
              phx-debounce="200"
            >
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
                <%= for stage <- @stages do %>
                  <.dropdown_menu_item>{stage}</.dropdown_menu_item>
                <% end %>
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

        <.scroll_area style="flex: 1;">
          <.flex
            direction="row"
            gap="6"
            p="6"
            style="display: flex !important; flex-direction: row !important; width: max-content; min-height: 100%;"
          >
            <%= for stage <- @stages do %>
              <% stage_candidates = Enum.filter(@filtered_candidates, &(&1.stage == stage)) %>
              <.flex direction="column" gap="4" style="width: 320px; flex-shrink: 0;">
                <.flex align="center" justify="space-between">
                  <.flex align="center" gap="2">
                    <.heading size="4" weight="bold">{stage}</.heading>
                    <.badge variant="soft" color="gray" size="1">{length(stage_candidates)}</.badge>
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
                  p="2"
                  style="flex: 1; min-height: 200px; background-color: var(--gray-3); border-radius: var(--radius-4);"
                >
                  <%= for candidate <- stage_candidates do %>
                    <.candidate_card candidate={candidate} stages={@stages} />
                  <% end %>
                </.flex>
              </.flex>
            <% end %>
          </.flex>
        </.scroll_area>

        <.alert_dialog_root id="candidate-detail" open={not is_nil(@selected_candidate)}>
          <.alert_dialog_content id="candidate-detail-content" style="--max-width: 600px;">
            <.candidate_detail_content candidate={@selected_candidate} stages={@stages} />
          </.alert_dialog_content>
        </.alert_dialog_root>
      </.flex>
    </div>
    """
  end

  defp candidate_detail_content(%{candidate: nil} = assigns), do: ~H""

  defp candidate_detail_content(assigns) do
    ~H"""
    <div style="position: relative;">
      <.flex justify="space-between" align="center">
        <.flex gap="4" align="center">
          <.avatar
            size="4"
            src={@candidate.src}
            fallback={String.slice(@candidate.name, 0, 2)}
          />
          <.flex direction="column">
            <.heading size="6" weight="bold">{@candidate.name}</.heading>
            <.text color="gray" size="2">{@candidate.role}</.text>
          </.flex>
        </.flex>
        <.flex align="center" gap="3">
          <.dropdown_menu_root>
            <.dropdown_menu_trigger>
              <.button variant="soft" color="gray" size="2">
                {@candidate.stage}
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="14"
                  height="14"
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
              <%= for s <- @stages do %>
                <.dropdown_menu_item
                  phx-click="move-candidate"
                  phx-value-id={@candidate.id}
                  phx-value-stage={s}
                >
                  {s}
                </.dropdown_menu_item>
              <% end %>
            </.dropdown_menu_content>
          </.dropdown_menu_root>

          <.alert_dialog_cancel>
            <.icon_button variant="ghost" color="gray" phx-click={close_detail()}>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
              </svg>
            </.icon_button>
          </.alert_dialog_cancel>
        </.flex>
      </.flex>

      <.tabs default_value="overview" mt="4">
        <:list :let={ctx}>
          <.tabs_list size="2" {ctx}>
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
                <.text_field value={"#{String.downcase(String.replace(@candidate.name, " ", "."))}@example.com"} />
              </.flex>
              <.flex direction="column" gap="1">
                <.text size="2" weight="bold">Phone</.text>
                <.text_field value="+1 (555) 000-0000" />
              </.flex>
            </.grid>
            <.flex direction="column" gap="1">
              <.text size="2" weight="bold">Source</.text>
              <.select_root id="candidate-source" value="LinkedIn">
                <.select_trigger placeholder="Select source..." />
                <.select_content>
                  <.select_item value="LinkedIn">LinkedIn</.select_item>
                  <.select_item value="Referral">Referral</.select_item>
                </.select_content>
              </.select_root>
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
              <.radio_group_root id="crm-recommendation" name="recommendation" default_value="hire">
                <.flex direction="column" gap="2">
                  <.radio_group_item value="hire">Strong Hire</.radio_group_item>
                  <.radio_group_item value="hold">Hold</.radio_group_item>
                  <.radio_group_item value="no">No Hire</.radio_group_item>
                </.flex>
              </.radio_group_root>
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
            <.separator size="4" style="width: 100%;" />
            <.button variant="soft" color="red" style="width: 100%;">Archive Candidate</.button>
          </.flex>
        </:content>
      </.tabs>
    </div>
    """
  end

  defp open_detail(id) do
    JS.push("select-candidate", value: %{id: id})
  end

  defp close_detail do
    JS.push("close-modal")
  end

  defp candidate_card(assigns) do
    ~H"""
    <.context_menu_root>
      <.context_menu_trigger>
        <.card
          p="3"
          style="background: white; cursor: pointer; transition: transform 0.1s; border: 1px solid var(--gray-4); user-select: none;"
          class="hover-lift"
          phx-click={open_detail(@candidate.id)}
        >
          <.flex direction="column" gap="3">
            <.flex justify="space-between" align="start">
              <.flex gap="3" align="center">
                <.avatar
                  size="1"
                  src={@candidate.src}
                  fallback={String.slice(@candidate.name, 0, 2)}
                />
                <.flex direction="column">
                  <.strong size="2">{@candidate.name}</.strong>
                  <.text size="1" color="gray">{@candidate.role}</.text>
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
                    style="background-color: var(--gray-1); border: 1px solid var(--gray-4); border-radius: var(--radius-2); box-shadow: var(--shadow-3); z-index: 100;"
                  >
                    <.strong size="2">Last Activity</.strong>
                    <.text size="1">Updated status to {@candidate.stage} 2 days ago.</.text>
                  </.flex>
                </.hover_card_content>
              </.hover_card_root>
            </.flex>

            <.flex gap="2" wrap="wrap">
              <%= for tag <- @candidate.tags do %>
                <.badge variant="surface" size="1" color="blue">{tag}</.badge>
              <% end %>
            </.flex>
          </.flex>
        </.card>
      </.context_menu_trigger>
      <.context_menu_content>
        <.context_menu_item phx-click={open_detail(@candidate.id)}>
          View Profile
        </.context_menu_item>
        <.context_menu_sub>
          <.context_menu_sub_trigger>Move Stage</.context_menu_sub_trigger>
          <.context_menu_sub_content>
            <%= for s <- @stages do %>
              <.context_menu_item
                phx-click="move-candidate"
                phx-value-id={@candidate.id}
                phx-value-stage={s}
              >
                {s}
              </.context_menu_item>
            <% end %>
          </.context_menu_sub_content>
        </.context_menu_sub>
        <.context_menu_separator />
        <.context_menu_item color="red">Archive</.context_menu_item>
      </.context_menu_content>
    </.context_menu_root>
    """
  end
end
