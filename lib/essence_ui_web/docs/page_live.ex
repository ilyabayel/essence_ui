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
    <div class="docs-shell essence-ui" data-accent-color="gray" data-gray-color="slate" data-radius="medium" data-scaling="100%">
      <aside class="docs-sidebar">
        <div class="docs-sidebar__brand">
          <.link navigate={~p"/docs"} class="docs-sidebar__logo">Essence UI</.link>
          <span class="docs-sidebar__muted">Docs</span>
        </div>

        <nav class="docs-sidebar__nav" aria-label="Documentation">
          <div :for={section <- @nav} class="docs-nav-section">
            <p class="docs-nav-section__title">{section.title}</p>
            <ul>
              <li :for={item <- section.items}>
                <.link
                  navigate={docs_path(item.path)}
                  class={["docs-nav-link", @page && @page.path == item.path && "is-active"]}
                >
                  {item.title}
                </.link>
              </li>
            </ul>
          </div>
        </nav>

        <p class="docs-sidebar__footer">
          <.link href="/getting_started" class="docs-nav-link">Storybook</.link>
        </p>
      </aside>

      <main class="docs-main">
        <div :if={@not_found} class="docs-missing">
          <h1>Page not found</h1>
          <p>No documentation exists at this path.</p>
          <.link navigate={~p"/docs"}>Back to docs</.link>
        </div>

        <article :if={@page} class="docs-article">
          <header class="docs-article__header">
            <h1>{@page.title}</h1>
            <p :if={@page.description} class="docs-article__description">{@page.description}</p>
          </header>

          <div class="docs-article__body">
            {render_markdown(assigns)}
          </div>
        </article>
      </main>
    </div>
    """
  end

  defp render_markdown(assigns) do
    MDEx.to_heex!(assigns.page.body, assigns: assigns)
  end

  defp path_from_params(%{"path" => path}) when is_list(path), do: Enum.join(path, "/")
  defp path_from_params(%{"path" => path}) when is_binary(path), do: path
  defp path_from_params(_), do: Catalog.home_path()

  defp docs_path(path) when is_binary(path), do: "/docs/#{path}"
end
