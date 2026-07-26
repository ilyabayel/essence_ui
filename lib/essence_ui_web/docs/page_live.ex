defmodule EssenceUIWeb.Docs.PageLive do
  @moduledoc false
  use EssenceUIWeb, :live_view
  use MDEx

  import EssenceUI.Components, warn: false
  import EssenceUIWeb.Docs.Components, warn: false
  import EssenceUIWeb.Components.SiteHeader
  import EssenceUIWeb.Components.SiteFooter

  alias EssenceUI.Primitives.AccessibleIcon, warn: false
  alias EssenceUI.Primitives.Accordion, warn: false
  alias EssenceUI.Primitives.AlertDialog, warn: false
  alias EssenceUI.Primitives.AspectRatio, warn: false
  alias EssenceUI.Primitives.Avatar, warn: false
  alias EssenceUI.Primitives.Checkbox, warn: false
  alias EssenceUI.Primitives.Collapsible, warn: false
  alias EssenceUI.Primitives.ContextMenu, warn: false
  alias EssenceUI.Primitives.Dialog, warn: false
  alias EssenceUI.Primitives.DirectionProvider, warn: false
  alias EssenceUI.Primitives.DropdownMenu, warn: false
  alias EssenceUI.Primitives.Form, warn: false
  alias EssenceUI.Primitives.HoverCard, warn: false
  alias EssenceUI.Primitives.Label, warn: false
  alias EssenceUI.Primitives.Menubar, warn: false
  alias EssenceUI.Primitives.NavigationMenu, warn: false
  alias EssenceUI.Primitives.OneTimePasswordField, warn: false
  alias EssenceUI.Primitives.PasswordToggleField, warn: false
  alias EssenceUI.Primitives.Popover, warn: false
  alias EssenceUI.Primitives.Progress, warn: false
  alias EssenceUI.Primitives.RadioGroup, warn: false
  alias EssenceUI.Primitives.ScrollArea, warn: false
  alias EssenceUI.Primitives.Select, warn: false
  alias EssenceUI.Primitives.Separator, warn: false
  alias EssenceUI.Primitives.Slider, warn: false
  alias EssenceUI.Primitives.Slot, warn: false
  alias EssenceUI.Primitives.Switch, warn: false
  alias EssenceUI.Primitives.Tabs, warn: false
  alias EssenceUI.Primitives.Toast, warn: false
  alias EssenceUI.Primitives.Toggle, warn: false
  alias EssenceUI.Primitives.ToggleGroup, warn: false
  alias EssenceUI.Primitives.Toolbar, warn: false
  alias EssenceUI.Primitives.Tooltip, warn: false
  alias EssenceUI.Primitives.VisuallyHidden, warn: false
  alias EssenceUIWeb.Docs.Catalog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page: nil, not_found: false, nav_open: false, toc: [], section: :themes)}
  end

  @impl true
  def handle_params(params, uri, socket) do
    section = section_from_uri(uri)
    path = path_from_params(params, section)
    nav = Catalog.nav(section)

    case Catalog.fetch(section, path) do
      {:ok, page} ->
        {prev, next} = Catalog.siblings(section, path)

        {:noreply,
         socket
         |> assign(:section, section)
         |> assign(:nav, nav)
         |> assign(:page, page)
         |> assign(:prev_page, prev)
         |> assign(:next_page, next)
         |> assign(:toc, extract_toc(page.body))
         |> assign(:not_found, false)
         |> assign(:nav_open, false)
         |> assign(:page_title, page.title)
         |> assign(:secondary, secondary_for(section))}

      :error ->
        {:noreply,
         socket
         |> assign(:section, section)
         |> assign(:nav, nav)
         |> assign(:page, nil)
         |> assign(:prev_page, nil)
         |> assign(:next_page, nil)
         |> assign(:toc, [])
         |> assign(:not_found, true)
         |> assign(:nav_open, false)
         |> assign(:page_title, "Not found")
         |> assign(:secondary, secondary_for(section))}
    end
  end

  @impl true
  def handle_event("toggle_nav", _params, socket) do
    {:noreply, update(socket, :nav_open, &(!&1))}
  end

  def handle_event("close_nav", _params, socket) do
    {:noreply, assign(socket, :nav_open, false)}
  end

  def handle_event("keydown", %{"key" => "Escape"}, socket) do
    {:noreply, assign(socket, :nav_open, false)}
  end

  def handle_event("keydown", _params, socket), do: {:noreply, socket}

  @impl true
  def render(assigns) do
    ~H"""
    <.theme
      appearance="inherit"
      accent_color="gray"
      gray_color="slate"
      radius="medium"
      scaling="100%"
      class={["docs-shell", "site-shell", @nav_open && "is-nav-open"]}
      phx-window-keydown="keydown"
    >
      <.site_header active={@section} secondary={@secondary} />

      <.es_link href="#docs-main-content" class="docs-skip-link" underline="none" high_contrast>
        Skip to content
      </.es_link>

      <.flex
        as="header"
        class="docs-topbar"
        align="center"
        justify="space-between"
        gap="3"
        px="3"
        py="2"
      >
        <.text size="2" weight="medium" high_contrast>Docs</.text>
        <.button
          type="button"
          variant="soft"
          color="gray"
          size="2"
          phx-click="toggle_nav"
          aria-expanded={to_string(@nav_open)}
          aria-controls="docs-sidebar"
          aria-label={if(@nav_open, do: "Close documentation menu", else: "Open documentation menu")}
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

      <.box
        as="aside"
        id="docs-sidebar"
        class={["docs-sidebar", @nav_open && "is-open"]}
        p="4"
        phx-hook="DocsSidebar"
        data-nav-open={to_string(@nav_open)}
        aria-label="Documentation"
      >
        <.flex
          class="docs-sidebar__mobile-header"
          align="center"
          justify="space-between"
          gap="3"
          mb="4"
          width="100%"
        >
          <.text size="3" weight="bold" id="docs-menu-label">Menu</.text>
          <.button
            type="button"
            variant="soft"
            color="gray"
            size="2"
            phx-click="close_nav"
            aria-label="Close documentation menu"
          >
            Close
          </.button>
        </.flex>

        <.scroll_area id="docs-sidebar-scroll" type="hover" class="docs-sidebar__scroll">
          <.flex direction="column" gap="5" class="docs-sidebar__inner">
            <.box as="nav" aria-label="Documentation pages">
              <.flex :for={section <- @nav} direction="column" gap="1" mb="4">
                <.text size="1" weight="bold" color="gray" class="docs-nav-section__title">
                  {section.title}
                </.text>
                <.es_link
                  :for={item <- section.items}
                  patch={docs_path(@section, item.path)}
                  underline="none"
                  color={nav_color(@page, item.path)}
                  high_contrast={nav_active?(@page, item.path)}
                  class={["docs-nav-link", nav_active?(@page, item.path) && "is-active"]}
                  aria-current={if(nav_active?(@page, item.path), do: "page")}
                >
                  <.text size="2">{item.title}</.text>
                </.es_link>
              </.flex>
            </.box>
          </.flex>
        </.scroll_area>
      </.box>

      <.box as="main" id="docs-main-content" class="docs-main" tabindex="-1">
        <.flex :if={@not_found} direction="column" align="center" gap="3" py="9" px="4">
          <.heading as="h1" size="6">Page not found</.heading>
          <.text color="gray">No documentation exists at this path.</.text>
          <.es_link patch={docs_path(@section, Catalog.home_path(@section))}>Back to docs</.es_link>
        </.flex>

        <.flex :if={@page} class="docs-article-wrap" gap="6">
          <.box as="article" class="docs-article">
            <.flex direction="column" gap="2" class="docs-article__header">
              <.heading as="h1" size="7" class="docs-article__title">{@page.title}</.heading>
              <.text :if={@page.description} size="3" color="gray">{@page.description}</.text>
            </.flex>

            <.box class="docs-article__body">
              {render_markdown(assigns)}
            </.box>

            <.flex
              :if={@prev_page || @next_page}
              justify="space-between"
              gap="4"
              wrap="wrap"
              class="docs-pager"
              mt="6"
              pt="4"
            >
              <.es_link
                :if={@prev_page}
                patch={docs_path(@section, @prev_page.path)}
                underline="hover"
              >
                <.text size="2">← {@prev_page.title}</.text>
              </.es_link>
              <.box :if={!@prev_page}></.box>
              <.es_link
                :if={@next_page}
                patch={docs_path(@section, @next_page.path)}
                underline="hover"
              >
                <.text size="2">{@next_page.title} →</.text>
              </.es_link>
            </.flex>
          </.box>

          <.box :if={@toc != []} as="nav" class="docs-toc" aria-label="On this page">
            <.text size="1" weight="bold" color="gray">On this page</.text>
            <.flex direction="column" gap="2" mt="3">
              <.es_link
                :for={item <- @toc}
                href={"##{item.id}"}
                underline="hover"
                color="gray"
                class={["docs-toc__link", "is-level-#{item.level}"]}
              >
                <.text size="1" color="gray">{item.title}</.text>
              </.es_link>
            </.flex>
          </.box>
        </.flex>
      </.box>

      <.site_footer />
    </.theme>
    """
  end

  defp render_markdown(assigns) do
    # Empty prefix → id="slug" matching TOC href="#slug" (MDEx default is no heading ids).
    MDEx.to_heex!(assigns.page.body,
      assigns: assigns,
      extension: [header_id_prefix: ""]
    )
  end

  defp section_from_uri(uri) do
    path = URI.parse(uri).path || ""

    cond do
      String.starts_with?(path, "/primitives") -> :primitives
      String.starts_with?(path, "/colors") -> :colors
      true -> :themes
    end
  end

  defp path_from_params(%{"path" => path}, _section) when is_list(path),
    do: Enum.join(path, "/")

  defp path_from_params(%{"path" => path}, _section) when is_binary(path), do: path
  defp path_from_params(_, section), do: Catalog.home_path(section)

  defp docs_path(section, path) when is_binary(path), do: "/#{section}/docs/#{path}"

  defp secondary_for(:themes), do: EssenceUIWeb.Components.SiteHeader.themes_secondary()
  defp secondary_for(:primitives), do: EssenceUIWeb.Components.SiteHeader.primitives_secondary()
  defp secondary_for(:colors), do: EssenceUIWeb.Components.SiteHeader.colors_secondary()

  defp nav_active?(%{path: path}, path), do: true
  defp nav_active?(_, _), do: false

  defp nav_color(page, path), do: if(nav_active?(page, path), do: nil, else: "gray")

  defp extract_toc(body) when is_binary(body) do
    Regex.scan(~r/^(##|###)\s+(.+)$/m, body)
    |> Enum.map(fn [_, hashes, title] ->
      title = String.trim(title)

      %{
        title: title,
        level: String.length(hashes),
        id: slugify(title)
      }
    end)
    |> Enum.reject(&(String.starts_with?(&1.title, "<") or &1.title == ""))
  end

  defp slugify(title) do
    title
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9\s-]/, "")
    |> String.replace(~r/\s+/, "-")
  end
end
