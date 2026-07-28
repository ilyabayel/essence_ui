defmodule EssenceUIWeb.PlaygroundLive do
  @moduledoc false
  use EssenceUIWeb, :live_view

  import EssenceUI.Components
  import EssenceUIWeb.Components.SiteHeader
  import EssenceUIWeb.Components.SiteFooter

  alias EssenceUI.Components.ThemePanel

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "Playground — Essence Themes",
       accent_color: "indigo",
       gray_color: "slate",
       appearance: "inherit",
       radius: "medium",
       scaling: "100%",
       panel_background: "solid",
       copied: false
     )}
  end

  @impl true
  def handle_event("theme_panel", params, socket) do
    socket =
      socket
      |> maybe_assign(params, "accent_color", :accent_color)
      |> maybe_assign(params, "gray_color", :gray_color)
      |> maybe_assign(params, "appearance", :appearance)
      |> maybe_assign(params, "radius", :radius)
      |> maybe_assign(params, "scaling", :scaling)
      |> maybe_assign(params, "panel_background", :panel_background)

    appearance = socket.assigns.appearance

    {:noreply, push_event(socket, "set_appearance", %{appearance: appearance})}
  end

  def handle_event("copy_theme", _params, socket) do
    snippet = ThemePanel.copy_snippet(socket.assigns)

    {:noreply,
     socket
     |> assign(:copied, true)
     |> push_event("copy_to_clipboard", %{text: snippet})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.theme
      appearance={@appearance}
      accent_color={@accent_color}
      gray_color={@gray_color}
      radius={@radius}
      scaling={@scaling}
      panel_background={@panel_background}
      class="site-shell playground-shell"
      id="playground-root"
      phx-hook="Clipboard"
    >
      <.site_header active={:themes} secondary={EssenceUIWeb.Components.SiteHeader.themes_secondary()} />

      <.box class="playground-layout">
        <.box class="playground-panel-wrap">
          <.theme_panel
            accent_color={@accent_color}
            gray_color={@gray_color}
            appearance={@appearance}
            radius={@radius}
            scaling={@scaling}
            panel_background={@panel_background}
          />
          <.text :if={@copied} size="1" color="green">Theme copied</.text>
        </.box>

        <.box class="playground-gallery" p="5">
          <.flex direction="column" gap="8">
            <.playground_section title="Button" docs="/themes/docs/components/button">
              <.flex gap="3" wrap="wrap">
                <.button variant="classic">Classic</.button>
                <.button variant="solid">Solid</.button>
                <.button variant="soft">Soft</.button>
                <.button variant="surface">Surface</.button>
                <.button variant="outline">Outline</.button>
                <.button variant="ghost">Ghost</.button>
              </.flex>
            </.playground_section>

            <.playground_section title="Text Field" docs="/themes/docs/components/text-field">
              <.flex gap="3" wrap="wrap" style="max-width: 28rem;">
                <.text_field placeholder="Surface" variant="surface" />
                <.text_field placeholder="Classic" variant="classic" />
                <.text_field placeholder="Soft" variant="soft" />
              </.flex>
            </.playground_section>

            <.playground_section title="Select" docs="/themes/docs/components/select">
              <.select_root id="playground-select" value="apple">
                <.select_trigger placeholder="Choose a fruit…" />
                <.select_content>
                  <.select_item value="apple">Apple</.select_item>
                  <.select_item value="orange">Orange</.select_item>
                  <.select_item value="grape">Grape</.select_item>
                </.select_content>
              </.select_root>
            </.playground_section>

            <.playground_section title="Card" docs="/themes/docs/components/card">
              <.card size="2" style="max-width: 20rem;">
                <.flex direction="column" gap="2">
                  <.heading as="h4" size="3">Card</.heading>
                  <.text size="2" color="gray">Surface card used across Themes examples.</.text>
                  <.button size="2">Action</.button>
                </.flex>
              </.card>
            </.playground_section>

            <.playground_section title="Badge · Avatar · Switch" docs="/themes/docs">
              <.flex gap="4" align="center" wrap="wrap">
                <.badge color="indigo">New</.badge>
                <.badge variant="outline" color="green">Active</.badge>
                <.avatar fallback="EU" color="indigo" />
                <.switch default_checked />
              </.flex>
            </.playground_section>

              <.playground_section title="Dialog" docs="/themes/docs/components/dialog">
                <.button>See Dialog docs for Themes dialog usage</.button>
              </.playground_section>
          </.flex>
        </.box>
      </.box>

      <.site_footer />
    </.theme>
    """
  end

  attr :title, :string, required: true
  attr :docs, :string, required: true
  slot :inner_block, required: true

  def playground_section(assigns) do
    ~H"""
    <.flex direction="column" gap="3">
      <.flex align="baseline" justify="space-between" gap="3" wrap="wrap">
        <.heading as="h2" size="5">{@title}</.heading>
        <.es_link navigate={@docs} underline="hover" color="gray">
          <.text size="1" color="gray">View in docs</.text>
        </.es_link>
      </.flex>
      {render_slot(@inner_block)}
    </.flex>
    """
  end

  defp maybe_assign(socket, params, key, atom) do
    case Map.get(params, key) do
      nil -> socket
      "" -> socket
      value -> assign(socket, atom, value)
    end
  end
end
