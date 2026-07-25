defmodule EssenceUIWeb.Components.SiteHeader do
  @moduledoc false
  use EssenceUIWeb, :html

  import EssenceUI.Components

  @products [
    %{id: :themes, label: "Themes", href: "/"},
    %{id: :primitives, label: "Primitives", href: "/primitives"},
    %{id: :colors, label: "Colors", href: "/colors"}
  ]

  attr :active, :atom, required: true, values: [:themes, :primitives, :colors]
  attr :secondary, :list, default: []
  attr :class, :any, default: nil

  def site_header(assigns) do
    assigns = assign(assigns, :products, @products)

    ~H"""
    <.flex
      as="header"
      class={["site-header", @class]}
      align="center"
      justify="space-between"
      gap="3"
      px="4"
      height="48px"
    >
      <.flex align="center" gap="4" min_width="0" class="site-header__left">
        <.es_link navigate="/" underline="none" high_contrast class="site-header__logo">
          <.text size="3" weight="bold" high_contrast>Essence</.text>
        </.es_link>

        <.box as="nav" aria-label="Products" class="site-header__products">
          <.flex align="center" gap="1">
            <.es_link
              :for={product <- @products}
              navigate={product.href}
              underline="none"
              class={[
                "site-header__product",
                @active == product.id && "is-active"
              ]}
            >
              <.text size="2" weight={if(@active == product.id, do: "medium", else: "regular")}>
                {product.label}
              </.text>
            </.es_link>
          </.flex>
        </.box>
      </.flex>

      <.flex align="center" gap="2" class="site-header__right">
        <.es_link
          :for={link <- @secondary}
          navigate={link[:navigate]}
          href={link[:href]}
          underline="none"
          color="gray"
          class="site-header__secondary"
        >
          <.text size="2" color="gray">{link.label}</.text>
        </.es_link>

        <.es_link
          href="https://github.com/ilyabayel/essence_ui"
          underline="none"
          color="gray"
          class="site-header__icon-btn"
          aria-label="View GitHub"
        >
          <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor" aria-hidden="true">
            <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z" />
          </svg>
        </.es_link>

        <button
          type="button"
          class="site-header__icon-btn"
          phx-hook="AppearanceToggle"
          id="appearance-toggle"
          aria-label="Toggle theme"
        >
          <svg
            class="site-header__sun"
            width="16"
            height="16"
            viewBox="0 0 15 15"
            fill="none"
            aria-hidden="true"
          >
            <path
              d="M7.5 0a.5.5 0 01.5.5v1a.5.5 0 01-1 0v-1A.5.5 0 017.5 0zM2.1 2.1a.5.5 0 01.7 0l.71.7a.5.5 0 11-.7.71l-.71-.7a.5.5 0 010-.71zM0 7.5a.5.5 0 01.5-.5h1a.5.5 0 010 1h-1A.5.5 0 010 7.5zm11.49-4.19a.5.5 0 01.7-.71l.71.71a.5.5 0 11-.7.7l-.71-.7zM7.5 12a.5.5 0 01.5.5v1a.5.5 0 01-1 0v-1a.5.5 0 01.5-.5zm-5.4-.6a.5.5 0 01.7 0l.71.7a.5.5 0 11-.7.71l-.71-.7a.5.5 0 010-.71zM12.5 7a.5.5 0 01.5.5v0a.5.5 0 01-.5.5h-1a.5.5 0 010-1h1zm-.39 4.4a.5.5 0 01.7-.7l.71.7a.5.5 0 11-.7.71l-.71-.7zM7.5 4A3.5 3.5 0 1011 7.5 3.5 3.5 0 007.5 4z"
              fill="currentColor"
            />
          </svg>
          <svg
            class="site-header__moon"
            width="16"
            height="16"
            viewBox="0 0 15 15"
            fill="none"
            aria-hidden="true"
          >
            <path
              d="M2.9 7.5a4.6 4.6 0 008.2-2.9A5.5 5.5 0 117.5 13 4.6 4.6 0 012.9 7.5z"
              fill="currentColor"
            />
          </svg>
        </button>
      </.flex>
    </.flex>
    """
  end

  def themes_secondary do
    [
      %{label: "Documentation", navigate: "/themes/docs"},
      %{label: "Playground", navigate: "/themes/playground"}
    ]
  end

  def primitives_secondary do
    [
      %{label: "Documentation", navigate: "/primitives/docs"}
    ]
  end

  def colors_secondary do
    [
      %{label: "Documentation", navigate: "/colors/docs"}
    ]
  end
end
