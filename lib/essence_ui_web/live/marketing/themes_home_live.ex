defmodule EssenceUIWeb.Marketing.ThemesHomeLive do
  @moduledoc false
  use EssenceUIWeb, :live_view

  import EssenceUI.Components
  import EssenceUIWeb.Components.SiteHeader
  import EssenceUIWeb.Components.SiteFooter

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "Essence UI — Themes",
       showcase: 0,
       install_snippet:
         """
         import EssenceUI.Components

         <.theme accent_color="indigo">
           <.button>Hey 👋</.button>
         </.theme>
         """
         |> String.trim()
     )}
  end

  @impl true
  def handle_event("set_showcase", %{"index" => index}, socket) do
    {:noreply, assign(socket, :showcase, String.to_integer(index))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.theme
      appearance="inherit"
      accent_color="indigo"
      gray_color="slate"
      radius="large"
      scaling="100%"
      class="site-shell marketing-shell themes-home"
    >
      <.site_header active={:themes} secondary={EssenceUIWeb.Components.SiteHeader.themes_secondary()} />

      <.box class="themes-home__hero-wrap">
        <.container size="4" class="themes-home__hero">
          <.grid columns="2" gap="6" align="center" class="themes-home__grid">
            <.flex direction="column" gap="4" class="themes-home__copy">
              <.es_link navigate="/themes/docs/overview/getting-started" underline="hover" class="themes-home__eyebrow">
                <.text size="2" weight="medium" color="indigo">Phoenix LiveView Themes →</.text>
              </.es_link>

              <h1 class="themes-home__title">Start building your app now</h1>

              <.text size="4" color="gray" class="themes-home__lede">
                An open source component library for Phoenix LiveView—accessible, themeable,
                and inspired by Radix Themes. Just import and go.
              </.text>

              <.box class="themes-home__code" phx-hook="CopyCode" id="hero-install-code">
                <pre><code>{@install_snippet}</code></pre>
                <button type="button" class="themes-home__copy-btn" data-copy>Copy</button>
              </.box>

              <.flex gap="3" wrap="wrap" align="center">
                <.button as="a" href="/themes/docs/overview/getting-started" size="3">
                  Get started →
                </.button>
                <.button as="a" href="/themes/playground" variant="soft" color="gray" size="3">
                  Playground
                </.button>
              </.flex>

              <.flex direction="column" gap="2" class="themes-home__examples-label">
                <.text size="1" color="gray">Live examples</.text>
                <.flex gap="2">
                  <button
                    :for={i <- 0..5}
                    type="button"
                    class={["themes-home__dot", @showcase == i && "is-active"]}
                    phx-click="set_showcase"
                    phx-value-index={i}
                    aria-label={"Example #{i + 1}"}
                  />
                </.flex>
              </.flex>
            </.flex>

            <.box class="themes-home__showcase">
              <.card :if={@showcase == 0} size="3" class="showcase-card">
                <.flex direction="column" gap="3">
                  <.heading as="h3" size="4">Your team</.heading>
                  <.text size="2" color="gray">Invite and manage your team members.</.text>
                  <.flex gap="2">
                    <.text_field placeholder="Email address" style="flex: 1;" />
                    <.button>Invite</.button>
                  </.flex>
                  <.flex :for={person <- team()} align="center" justify="space-between" gap="3">
                    <.flex align="center" gap="3">
                      <.avatar size="3" fallback={person.initials} color={person.color} />
                      <.flex direction="column" gap="0">
                        <.text size="2" weight="medium">{person.name}</.text>
                        <.text size="1" color="gray">{person.email}</.text>
                      </.flex>
                    </.flex>
                    <.icon_button variant="ghost" color="gray" size="1" aria-label="More">
                      <svg width="15" height="15" viewBox="0 0 15 15" fill="currentColor" aria-hidden="true">
                        <path d="M3.5 7.5a1 1 0 11-2 0 1 1 0 012 0zm5 0a1 1 0 11-2 0 1 1 0 012 0zm5 0a1 1 0 11-2 0 1 1 0 012 0z" />
                      </svg>
                    </.icon_button>
                  </.flex>
                </.flex>
              </.card>

              <.card :if={@showcase == 1} size="3" class="showcase-card">
                <.flex direction="column" gap="3">
                  <.heading as="h3" size="4">Notifications</.heading>
                  <.text size="2" color="gray">Manage your notification settings.</.text>
                  <.flex direction="column" gap="3">
                    <.flex :for={row <- notify_rows()} justify="space-between" align="center" gap="3">
                      <.text size="2">{row}</.text>
                      <.switch default_checked />
                    </.flex>
                  </.flex>
                </.flex>
              </.card>

              <.card :if={@showcase == 2} size="3" class="showcase-card">
                <.flex direction="column" gap="3">
                  <.heading as="h3" size="4">Sign in</.heading>
                  <.flex direction="column" gap="2">
                    <.text size="1" weight="medium">Email address</.text>
                    <.text_field type="email" placeholder="Enter your email" />
                  </.flex>
                  <.flex direction="column" gap="2">
                    <.flex justify="space-between">
                      <.text size="1" weight="medium">Password</.text>
                      <.es_link href="#" underline="hover">
                        <.text size="1">Forgot password?</.text>
                      </.es_link>
                    </.flex>
                    <.text_field type="password" placeholder="Enter your password" />
                  </.flex>
                  <.flex gap="2">
                    <.button variant="soft" color="gray" style="flex: 1;">Create an account</.button>
                    <.button style="flex: 1;">Sign in</.button>
                  </.flex>
                </.flex>
              </.card>

              <.card :if={@showcase == 3} size="3" class="showcase-card">
                <.flex direction="column" gap="3">
                  <.heading as="h3" size="4">Invoice paid</.heading>
                  <.flex align="center" gap="3">
                    <.badge color="green" variant="soft" size="2">Paid</.badge>
                    <.text size="5" weight="bold">$4,280.00</.text>
                  </.flex>
                  <.text size="2" color="gray">
                    Receipt sent to finance@example.com
                  </.text>
                  <.flex gap="2">
                    <.button variant="soft">Next invoice</.button>
                    <.button variant="ghost" color="gray">Done</.button>
                  </.flex>
                </.flex>
              </.card>

              <.card :if={@showcase == 4} size="3" class="showcase-card">
                <.flex direction="column" gap="3">
                  <.heading as="h3" size="4">Recent activity</.heading>
                  <.flex :for={item <- activity()} align="center" gap="3">
                    <.avatar size="2" fallback={item.initials} color={item.color} />
                    <.text size="2">
                      <.strong>{item.name}</.strong>
                      {item.action}
                    </.text>
                  </.flex>
                </.flex>
              </.card>

              <.card :if={@showcase == 5} size="3" class="showcase-card">
                <.flex direction="column" gap="3">
                  <.heading as="h3" size="4">To-do</.heading>
                  <.flex :for={task <- todos()} align="center" gap="3">
                    <.checkbox default_checked={task.done} />
                    <.text size="2" style={if(task.done, do: "text-decoration: line-through; opacity: 0.6;")}>
                      {task.label}
                    </.text>
                  </.flex>
                </.flex>
              </.card>
            </.box>
          </.grid>
        </.container>
      </.box>

      <.site_footer />
    </.theme>
    """
  end

  defp team do
    [
      %{name: "Ava Chen", email: "ava@essence.dev", initials: "AC", color: "indigo"},
      %{name: "Noah Patel", email: "noah@essence.dev", initials: "NP", color: "cyan"},
      %{name: "Mia Ortega", email: "mia@essence.dev", initials: "MO", color: "crimson"}
    ]
  end

  defp notify_rows, do: ["Comments", "Mentions", "Product updates"]

  defp activity do
    [
      %{name: "Ava", action: "approved invoice #1842", initials: "AC", color: "indigo"},
      %{name: "Noah", action: "invited 2 teammates", initials: "NP", color: "cyan"},
      %{name: "Mia", action: "closed support #91", initials: "MO", color: "crimson"}
    ]
  end

  defp todos do
    [
      %{label: "Review pull request #128", done: false},
      %{label: "Ship Themes docs vertical slice", done: true},
      %{label: "Polish playground ThemePanel", done: false}
    ]
  end
end
