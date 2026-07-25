defmodule EssenceUIWeb.Docs.PageLive do
  @moduledoc false
  use EssenceUIWeb, :live_view
  use MDEx

  # Imported for MDEx HEEx evaluation of page Markdown bodies.
  import EssenceUI.Components, warn: false
  import EssenceUIWeb.Docs.Components, warn: false

  alias EssenceUI.Primitives.Dialog, warn: false
  alias EssenceUIWeb.Docs.Catalog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, nav: Catalog.nav(), page: nil, not_found: false, nav_open: false)}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    path = path_from_params(params)

    case Catalog.fetch(path) do
      {:ok, page} ->
        {:noreply,
         socket
         |> assign(:page, page)
         |> assign(:not_found, false)
         |> assign(:nav_open, false)
         |> assign(:page_title, page.title)}

      :error ->
        {:noreply,
         socket
         |> assign(:page, nil)
         |> assign(:not_found, true)
         |> assign(:nav_open, false)
         |> assign(:page_title, "Not found")}
    end
  end

  @impl true
  def handle_event("toggle_nav", _params, socket) do
    {:noreply, update(socket, :nav_open, &(!&1))}
  end

  @impl true
  def handle_event("close_nav", _params, socket) do
    {:noreply, assign(socket, :nav_open, false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.box
      class={["essence-ui", "docs-shell", @nav_open && "is-nav-open"]}
      data-accent-color="gray"
      data-gray-color="slate"
      data-radius="medium"
      data-scaling="100%"
    >
      <.flex class="docs-topbar" align="center" justify="space-between" gap="3" px="3" py="2">
        <.flex align="center" gap="2" min_width="0">
          <.es_link navigate={~p"/docs"} underline="none" high_contrast>
            <.text size="3" weight="bold" high_contrast>Essence UI</.text>
          </.es_link>
          <.badge size="1" variant="soft" color="gray">Docs</.badge>
        </.flex>

        <.button
          type="button"
          variant="soft"
          color="gray"
          size="2"
          phx-click="toggle_nav"
          aria-expanded={to_string(@nav_open)}
          aria-controls="docs-sidebar"
          aria-label="Open documentation menu"
        >
          Menu
        </.button>
      </.flex>

      <.box
        :if={@nav_open}
        class="docs-nav-backdrop"
        phx-click="close_nav"
        aria-hidden="true"
      >
      </.box>

      <.box as="aside" id="docs-sidebar" class={["docs-sidebar", @nav_open && "is-open"]} p="4">
        <.flex
          class="docs-sidebar__mobile-header"
          align="center"
          justify="space-between"
          gap="3"
          mb="4"
          width="100%"
        >
          <.text size="3" weight="bold">Menu</.text>
          <.button type="button" variant="soft" color="gray" size="2" phx-click="close_nav">
            Close
          </.button>
        </.flex>

        <.scroll_area type="hover" class="docs-sidebar__scroll">
          <.flex direction="column" gap="5" class="docs-sidebar__inner">
            <.flex align="baseline" gap="2" class="docs-sidebar__brand">
              <.es_link navigate={~p"/docs"} underline="none" high_contrast>
                <.text size="5" weight="bold" high_contrast>Essence UI</.text>
              </.es_link>
              <.badge size="1" variant="soft" color="gray">Docs</.badge>
            </.flex>

            <.box as="nav" aria-label="Documentation">
              <.flex :for={section <- @nav} direction="column" gap="1" mb="4">
                <.text size="1" weight="bold" color="gray" class="docs-nav-section__title">
                  {section.title}
                </.text>
                <.es_link
                  :for={item <- section.items}
                  navigate={docs_path(item.path)}
                  underline="none"
                  color={nav_color(@page, item.path)}
                  high_contrast={nav_active?(@page, item.path)}
                  class={["docs-nav-link", nav_active?(@page, item.path) && "is-active"]}
                >
                  <.text size="2">{item.title}</.text>
                </.es_link>
              </.flex>
            </.box>

            <.box mt="auto" pt="4">
              <.separator size="1" mb="3" />
              <.es_link href="/getting_started" underline="hover" color="gray">
                <.text size="1" color="gray">Storybook</.text>
              </.es_link>
            </.box>
          </.flex>
        </.scroll_area>
      </.box>

      <.box as="main" class="docs-main">
        <.flex :if={@not_found} direction="column" align="center" gap="3" py="9" px="4">
          <.heading as="h1" size="6">Page not found</.heading>
          <.text color="gray">No documentation exists at this path.</.text>
          <.es_link navigate={~p"/docs"}>Back to docs</.es_link>
        </.flex>

        <.box :if={@page} as="article" class="docs-article">
          <.flex direction="column" gap="2" class="docs-article__header">
            <.heading as="h1" size="7" class="docs-article__title">{@page.title}</.heading>
            <.text :if={@page.description} size="3" color="gray">{@page.description}</.text>
          </.flex>

          <.box class="docs-article__body">
            {render_markdown(assigns)}
          </.box>
        </.box>
      </.box>
    </.box>
    """
  end

  defp render_markdown(assigns) do
    MDEx.to_heex!(assigns.page.body, assigns: assigns)
  end

  defp path_from_params(%{"path" => path}) when is_list(path), do: Enum.join(path, "/")
  defp path_from_params(%{"path" => path}) when is_binary(path), do: path
  defp path_from_params(_), do: Catalog.home_path()

  defp docs_path(path) when is_binary(path), do: "/docs/#{path}"

  defp nav_active?(%{path: path}, path), do: true
  defp nav_active?(_, _), do: false

  defp nav_color(page, path), do: if(nav_active?(page, path), do: nil, else: "gray")
end
