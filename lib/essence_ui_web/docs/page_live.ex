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
    {:ok, assign(socket, nav: Catalog.nav(), page: nil, not_found: false)}
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
         |> assign(:page_title, page.title)}

      :error ->
        {:noreply,
         socket
         |> assign(:page, nil)
         |> assign(:not_found, true)
         |> assign(:page_title, "Not found")}
    end
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.flex
      class="essence-ui docs-shell"
      data-accent-color="gray"
      data-gray-color="slate"
      data-radius="medium"
      data-scaling="100%"
      style="min-height: 100vh;"
    >
      <.box
        as="aside"
        class="docs-sidebar"
        p="4"
        style="width: 240px; flex-shrink: 0; position: sticky; top: 0; align-self: start; height: 100vh; border-right: 1px solid var(--gray-a5); background: var(--gray-a2);"
      >
        <.scroll_area type="hover" style="height: calc(100vh - 2rem);">
          <.flex direction="column" gap="5" style="min-height: 100%;">
            <.flex align="baseline" gap="2" mb="1">
              <.es_link navigate={~p"/docs"} underline="none" high_contrast>
                <.text size="5" weight="bold" high_contrast>Essence UI</.text>
              </.es_link>
              <.badge size="1" variant="soft" color="gray">Docs</.badge>
            </.flex>

            <.box as="nav" aria-label="Documentation">
              <.flex :for={section <- @nav} direction="column" gap="1" mb="4">
                <.text
                  size="1"
                  weight="bold"
                  color="gray"
                  style="display: block; margin-bottom: 0.25rem; text-transform: uppercase; letter-spacing: 0.04em;"
                >
                  {section.title}
                </.text>
                <.es_link
                  :for={item <- section.items}
                  navigate={docs_path(item.path)}
                  underline="none"
                  color={nav_color(@page, item.path)}
                  high_contrast={nav_active?(@page, item.path)}
                  class={["docs-nav-link", nav_active?(@page, item.path) && "is-active"]}
                  style="display: block; padding: 0.35rem 0.5rem; border-radius: var(--radius-2);"
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

      <.box as="main" p="6" style="flex: 1; min-width: 0;">
        <.flex :if={@not_found} direction="column" align="center" gap="3" py="9">
          <.heading as="h1" size="6">Page not found</.heading>
          <.text color="gray">No documentation exists at this path.</.text>
          <.es_link navigate={~p"/docs"}>Back to docs</.es_link>
        </.flex>

        <.box
          :if={@page}
          as="article"
          class="docs-article"
          style="max-width: 48rem; margin: 0 auto;"
        >
          <.flex
            direction="column"
            gap="2"
            mb="5"
            pb="4"
            style="border-bottom: 1px solid var(--gray-a5);"
          >
            <.heading as="h1" size="8">{@page.title}</.heading>
            <.text :if={@page.description} size="4" color="gray">{@page.description}</.text>
          </.flex>

          <.box class="docs-article__body">
            {render_markdown(assigns)}
          </.box>
        </.box>
      </.box>
    </.flex>
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
