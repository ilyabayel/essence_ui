defmodule EssenceUIWeb.Marketing.ColorsHomeLive do
  @moduledoc false
  use EssenceUIWeb, :live_view

  import EssenceUI.Components
  import EssenceUIWeb.Components.SiteHeader
  import EssenceUIWeb.Components.SiteFooter

  alias EssenceUI.Components.Theme

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "Essence UI — Colors",
       copied: nil
     )}
  end

  @impl true
  def handle_event("copy_swatch", %{"scale" => scale, "step" => step}, socket) do
    var = "--#{scale}-#{step}"

    {:noreply,
     socket
     |> assign(:copied, var)
     |> push_event("copy_to_clipboard", %{text: "var(#{var})"})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.theme
      appearance="inherit"
      accent_color="indigo"
      gray_color="slate"
      radius="medium"
      scaling="100%"
      class="site-shell marketing-shell colors-home"
      id="colors-home"
      phx-hook="Clipboard"
    >
      <.site_header active={:colors} secondary={EssenceUIWeb.Components.SiteHeader.colors_secondary()} />

      <.section py="9">
        <.container size="3">
          <.flex direction="column" gap="4">
            <h1 class="marketing-display-title">A gorgeous, accessible color system</h1>
            <.text size="4" color="gray">
              12-step scales for gray and accent palettes—designed for UI, wired into Essence Themes.
            </.text>
            <.flex gap="3" wrap="wrap">
              <.button as="a" href="/colors/docs/overview/getting-started" size="3">
                Go to docs
              </.button>
            </.flex>
            <.text :if={@copied} size="2" color="green">Copied {@copied}</.text>
          </.flex>
        </.container>
      </.section>

      <.section py="6">
        <.container size="4">
          <.flex direction="column" gap="6">
            <.box :for={scale <- gray_scales()} class="color-scale">
              <.text size="2" weight="bold" high_contrast>{scale}</.text>
              <.flex gap="1" wrap="wrap" class="color-scale__swatches">
                <button
                  :for={step <- 1..12}
                  type="button"
                  class="color-scale__swatch"
                  style={"background: var(--#{scale}-#{step})"}
                  phx-click="copy_swatch"
                  phx-value-scale={scale}
                  phx-value-step={step}
                  title={"#{scale} #{step}"}
                  aria-label={"Copy #{scale} #{step}"}
                />
              </.flex>
            </.box>

            <.separator size="4" />

            <.box :for={scale <- accent_scales()} class="color-scale">
              <.text size="2" weight="bold" high_contrast>{scale}</.text>
              <.flex gap="1" wrap="wrap" class="color-scale__swatches">
                <button
                  :for={step <- 1..12}
                  type="button"
                  class="color-scale__swatch"
                  style={"background: var(--#{scale}-#{step})"}
                  phx-click="copy_swatch"
                  phx-value-scale={scale}
                  phx-value-step={step}
                  title={"#{scale} #{step}"}
                  aria-label={"Copy #{scale} #{step}"}
                />
              </.flex>
            </.box>
          </.flex>
        </.container>
      </.section>

      <.site_footer />
    </.theme>
    """
  end

  defp gray_scales, do: Enum.reject(Theme.gray_colors(), &(&1 == "auto"))

  defp accent_scales, do: Enum.reject(Theme.accent_colors(), &(&1 == "gray"))
end
