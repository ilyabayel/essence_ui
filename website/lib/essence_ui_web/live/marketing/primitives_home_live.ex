defmodule EssenceUIWeb.Marketing.PrimitivesHomeLive do
  @moduledoc false
  use EssenceUIWeb, :live_view

  import EssenceUI.Components
  import EssenceUIWeb.Components.SiteHeader
  import EssenceUIWeb.Components.SiteFooter

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Essence UI — Primitives")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.theme
      appearance="inherit"
      accent_color="violet"
      gray_color="mauve"
      radius="medium"
      scaling="100%"
      class="site-shell marketing-shell primitives-home"
    >
      <.site_header
        active={:primitives}
        secondary={EssenceUIWeb.Components.SiteHeader.primitives_secondary()}
      />

      <.section py="9">
        <.container size="3">
          <.flex direction="column" gap="5" align="start">
            <h1 class="marketing-display-title">Core building blocks for your design system</h1>
            <.text size="4" color="gray">
              Unstyled, accessible Phoenix LiveView primitives for high-quality apps and design systems.
            </.text>
            <.button as="a" href="/primitives/docs/overview/getting-started" size="3">
              View docs →
            </.button>
          </.flex>
        </.container>
      </.section>

      <.section py="6">
        <.container size="4">
          <.grid columns="3" gap="4" class="primitives-home__grid">
            <.card :for={feature <- features()} size="2">
              <.flex direction="column" gap="2">
                <.heading as="h3" size="4">{feature.title}</.heading>
                <.text size="2" color="gray">{feature.body}</.text>
              </.flex>
            </.card>
          </.grid>
        </.container>
      </.section>

      <.site_footer />
    </.theme>
    """
  end

  defp features do
    [
      %{
        title: "Dialog",
        body: "Modal and non-modal modes, focus control, and screen-reader friendly semantics."
      },
      %{
        title: "Dropdown Menu",
        body: "Submenus, checkable items, keyboard navigation, and typeahead support."
      },
      %{
        title: "Popover",
        body: "Fine-grained focus control with collision-aware positioning."
      },
      %{
        title: "Select",
        body: "Accessible listbox with keyboard support and Themes-ready styling."
      },
      %{
        title: "Tabs",
        body: "Arrow-key navigation with horizontal or vertical orientation."
      },
      %{
        title: "Tooltip",
        body: "Label overflow content with sensible open and close delays."
      }
    ]
  end
end
