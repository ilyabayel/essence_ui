defmodule Storybook.Examples.DashboardStory do
  @moduledoc false
  use PhoenixStorybook.Story, :example
  use Phoenix.Component

  import EssenceUI.Components, except: [quote: 1]

  @impl true
  def render(assigns) do
    ~H"""
    <div
      data-scaling="100%"
      data-radius="medium"
      style="display: block; min-height: 100vh;"
      data-gray-color="slate"
      data-accent-color="blue"
      class="essence-ui"
    >
      <.flex direction="column" gap="4" p="6" style="max-width: 1400px; margin: 0 auto;">
        <%!-- Header --%>
        <.flex justify="between" align="center" mb="4">
          <.heading size="6" weight="bold" mr="2">Shadboard</.heading>
          <.flex gap="3" align="center">
            <.badge variant="soft" size="2" mr="2">
              +99
            </.badge>
            <.icon_button variant="ghost" size="2">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <path d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </.icon_button>
            <.icon_button variant="ghost" size="2">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <path d="M12 2v20M2 12h20" />
              </svg>
            </.icon_button>
            <.icon_button variant="ghost" size="2">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="20"
                height="20"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <circle cx="12" cy="12" r="10" />
                <path d="M12 6v6l4 2" />
              </svg>
            </.icon_button>
          </.flex>
        </.flex>
        <%!-- Top Metrics Row --%>
        <.grid columns={%{xs: "1", sm: "2", md: "4"}} gap="4">
          <.card p="4">
            <.flex direction="column" gap="1">
              <.heading as="h3" size="1" color="gray">Total Sales</.heading>
              <.text size="7" weight="bold">$1,243,000</.text>
            </.flex>
          </.card>

          <.card p="4">
            <.flex direction="column" gap="1">
              <.heading as="h3" size="1" color="gray">Revenue Summary</.heading>
              <.text size="7" weight="bold">$952,000</.text>
            </.flex>
          </.card>

          <.card p="4">
            <.flex direction="column" gap="1">
              <.heading as="h3" size="2" color="gray">Number of Orders</.heading>
              <.text size="7" weight="bold">256</.text>
            </.flex>
          </.card>

          <.card p="4">
            <.flex direction="column" gap="1">
              <.heading as="h3" size="2" color="gray">Avg. Order Value</.heading>
              <.text size="7" weight="bold">$4,648</.text>
            </.flex>
          </.card>
        </.grid>
        <%!-- Analytics Cards Grid --%>
        <.grid columns={%{xs: "1", sm: "2", md: "4"}} gap="4">
          <%!-- Unique Visitors --%>
          <.card p="4">
            <.flex direction="column" gap="3">
              <.flex justify="between" align="center">
                <.heading as="h3" size="2" color="gray">Unique Visitors</.heading>
                <.icon_button variant="ghost" size="1" style="color: #666;">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    viewBox="0 0 24 24"
                    fill="currentColor"
                  >
                    <circle cx="12" cy="6" r="2" />
                    <circle cx="12" cy="12" r="2" />
                    <circle cx="12" cy="18" r="2" />
                  </svg>
                </.icon_button>
              </.flex>
              <.flex direction="column" gap="1">
                <.text size="6" weight="bold">15,092</.text>
                <.text size="1" style="color: #4ade80;">+7% ↗</.text>
              </.flex>
              <div style="height: 60px; background: linear-gradient(to top, #1e40af 0%, #3b82f6 100%); border-radius: 8px; margin-top: 8px;">
              </div>
            </.flex>
          </.card>
          <%!-- Avg. Session Duration --%>
          <.card p="4">
            <.flex direction="column" gap="3">
              <.flex justify="between" align="center">
                <.heading as="h3" size="2" color="gray">Avg. Session Duration</.heading>
                <.icon_button variant="ghost" size="1" style="color: #666;">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    viewBox="0 0 24 24"
                    fill="currentColor"
                  >
                    <circle cx="12" cy="6" r="2" />
                    <circle cx="12" cy="12" r="2" />
                    <circle cx="12" cy="18" r="2" />
                  </svg>
                </.icon_button>
              </.flex>
              <.flex direction="column" gap="1">
                <.text size="6" weight="bold">1m 13s</.text>
                <.text size="1" style="color: #f87171;">-4% ↘</.text>
              </.flex>
              <.flex gap="2" align="end" style="height: 60px; margin-top: 8px;">
                <div style="flex: 1; background: #3b82f6; border-radius: 4px; height: 30%;"></div>
                <div style="flex: 1; background: #10b981; border-radius: 4px; height: 60%;"></div>
                <div style="flex: 1; background: #3b82f6; border-radius: 4px; height: 45%;"></div>
                <div style="flex: 1; background: #10b981; border-radius: 4px; height: 25%;"></div>
                <div style="flex: 1; background: #3b82f6; border-radius: 4px; height: 50%;"></div>
                <div style="flex: 1; background: #10b981; border-radius: 4px; height: 70%;"></div>
              </.flex>
            </.flex>
          </.card>
          <%!-- Bounce Rate --%>
          <.card p="4">
            <.flex direction="column" gap="3">
              <.flex justify="between" align="center">
                <.heading as="h3" size="2" color="gray">Bounce Rate</.heading>
                <.icon_button variant="ghost" size="1" style="color: #666;">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    viewBox="0 0 24 24"
                    fill="currentColor"
                  >
                    <circle cx="12" cy="6" r="2" />
                    <circle cx="12" cy="12" r="2" />
                    <circle cx="12" cy="18" r="2" />
                  </svg>
                </.icon_button>
              </.flex>
              <.flex direction="column" gap="1">
                <.text size="6" weight="bold">59%</.text>
                <.text size="1" style="color: #4ade80;">+5% ↗</.text>
              </.flex>
              <div style="height: 60px; position: relative; margin-top: 8px;">
                <svg width="100%" height="60" style="overflow: visible;">
                  <path
                    d="M 0 40 Q 20 20, 40 25 T 80 35 T 120 20 T 160 30 T 200 15"
                    fill="none"
                    stroke="#f97316"
                    stroke-width="2"
                  />
                </svg>
              </div>
            </.flex>
          </.card>
          <%!-- Conversion Rate --%>
          <.card p="4">
            <.flex direction="column" gap="3">
              <.flex justify="between" align="center">
                <.heading as="h3" size="2" color="gray">Conversion Rate</.heading>
                <.icon_button variant="ghost" size="1" style="color: #666;">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    viewBox="0 0 24 24"
                    fill="currentColor"
                  >
                    <circle cx="12" cy="6" r="2" />
                    <circle cx="12" cy="12" r="2" />
                    <circle cx="12" cy="18" r="2" />
                  </svg>
                </.icon_button>
              </.flex>
              <.flex direction="column" gap="1">
                <.text size="6" weight="bold">56%</.text>
                <.text size="1" style="color: #4ade80;">+4% ↗</.text>
              </.flex>
              <div style="height: 60px; background: linear-gradient(to top, #7c3aed 0%, #a78bfa 100%); border-radius: 8px; margin-top: 8px; clip-path: polygon(0 100%, 10% 80%, 20% 60%, 30% 70%, 40% 50%, 50% 45%, 60% 55%, 70% 40%, 80% 30%, 90% 20%, 100% 0, 100% 100%);">
              </div>
            </.flex>
          </.card>
        </.grid>
        <%!-- Bottom Row --%>
        <.grid columns={%{xs: "1", sm: "2", lg: "4"}} gap="4">
          <%!-- Total Revenue Chart --%>
          <.card p="4">
            <.flex direction="column" gap="3">
              <.flex direction="column" gap="1">
                <.heading as="h3" size="2" color="gray">Total Revenue</.heading>
                <.text size="6" weight="bold">$80,000</.text>
                <.text size="1" style="color: #4ade80;">+25% ↗</.text>
              </.flex>
              <.flex gap="1" align="end" style="height: 60px;">
                <div
                  :for={height <- [40, 50, 55, 45, 60, 65, 70, 50, 75, 80]}
                  style={"flex: 1; background: #10b981; border-radius: 4px 4px 0 0; height: #{height}%;"}
                >
                </div>
              </.flex>
            </.flex>
          </.card>
          <%!-- Leads Donut Chart --%>
          <.card p="4">
            <.heading as="h3" size="2" color="gray">Leads</.heading>
            <.flex direction="column" gap="3" align="center">
              <div style="position: relative; width: 120px; height: 120px;">
                <svg width="120" height="120" viewBox="0 0 120 120">
                  <circle cx="60" cy="60" r="50" fill="none" stroke="#3b82f6" stroke-width="20" />
                  <circle
                    cx="60"
                    cy="60"
                    r="50"
                    fill="none"
                    stroke="#10b981"
                    stroke-width="20"
                    stroke-dasharray="94 314"
                    stroke-dashoffset="-157"
                  />
                  <circle
                    cx="60"
                    cy="60"
                    r="50"
                    fill="none"
                    stroke="#f59e0b"
                    stroke-width="20"
                    stroke-dasharray="63 314"
                    stroke-dashoffset="-251"
                  />
                  <circle
                    cx="60"
                    cy="60"
                    r="50"
                    fill="none"
                    stroke="#ef4444"
                    stroke-width="20"
                    stroke-dasharray="31 314"
                    stroke-dashoffset="-283"
                  />
                </svg>
                <.flex
                  direction="column"
                  align="center"
                  justify="center"
                  style="position: absolute; top: 0; left: 0; right: 0; bottom: 0;"
                >
                  <.text size="6" weight="bold">2,200</.text>
                </.flex>
              </div>
            </.flex>
          </.card>
          <%!-- Gender Distribution --%>
          <.card p="4">
            <.flex direction="column" gap="3">
              <.heading as="h3" size="2" color="gray">Gender Distribution</.heading>
              <.flex gap="3" align="center" justify="center">
                <div style="position: relative; width: 100px; height: 100px;">
                  <svg width="100" height="100" viewBox="0 0 100 100">
                    <circle cx="50" cy="50" r="40" fill="none" stroke="#3b82f6" stroke-width="20" />
                    <circle
                      cx="50"
                      cy="50"
                      r="40"
                      fill="none"
                      stroke="#10b981"
                      stroke-width="20"
                      stroke-dasharray="108 252"
                      stroke-dashoffset="-126"
                    />
                    <circle
                      cx="50"
                      cy="50"
                      r="40"
                      fill="none"
                      stroke="#f97316"
                      stroke-width="20"
                      stroke-dasharray="8 252"
                      stroke-dashoffset="-234"
                    />
                  </svg>
                </div>
                <.flex direction="column" gap="2">
                  <.flex gap="2" align="center">
                    <div style="width: 12px; height: 12px; background: #3b82f6; border-radius: 2px;">
                    </div>
                    <.text size="1" style="color: #888;">Male 54%</.text>
                  </.flex>
                  <.flex gap="2" align="center">
                    <div style="width: 12px; height: 12px; background: #10b981; border-radius: 2px;">
                    </div>
                    <.text size="1" style="color: #888;">Female 43%</.text>
                  </.flex>
                  <.flex gap="2" align="center">
                    <div style="width: 12px; height: 12px; background: #f97316; border-radius: 2px;">
                    </div>
                    <.text size="1" style="color: #888;">Other 3%</.text>
                  </.flex>
                </.flex>
              </.flex>
            </.flex>
          </.card>
          <%!-- New vs Returning --%>
          <.card p="4">
            <.flex direction="column" gap="3">
              <.heading as="h3" size="2" color="gray">New vs. Returning Visitors</.heading>
              <.flex gap="2" style="height: 8px; border-radius: 4px; overflow: hidden;">
                <div style="flex: 65; background: #3b82f6;"></div>
                <div style="flex: 35; background: #10b981;"></div>
              </.flex>
              <.flex justify="between">
                <.flex direction="column" gap="1">
                  <.flex gap="2" align="center">
                    <div style="width: 8px; height: 8px; background: #3b82f6; border-radius: 50%;">
                    </div>
                    <.text size="1" style="color: #888;">New</.text>
                  </.flex>
                  <.text size="5" weight="bold">7,234</.text>
                  <.text size="4" weight="medium" style="color: #3b82f6;">65%</.text>
                </.flex>
                <.flex direction="column" gap="1">
                  <.flex gap="2" align="center">
                    <div style="width: 8px; height: 8px; background: #10b981; border-radius: 50%;">
                    </div>
                    <.text size="1" style="color: #888;">Returning</.text>
                  </.flex>
                  <.text size="5" weight="bold">4,128</.text>
                  <.text size="4" weight="medium" style="color: #10b981;">35%</.text>
                </.flex>
              </.flex>
            </.flex>
          </.card>
        </.grid>
        <%!-- Customer Insights --%>
        <.card p="5">
          <.flex direction="column" gap="4">
            <.flex justify="between" align="center">
              <.flex direction="column" gap="1">
                <.heading as="h3" size="5" weight="bold">Customer Insights</.heading>
                <.text size="2" color="gray">Last month</.text>
              </.flex>
              <.icon_button variant="ghost" size="1" style="color: #666;">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  viewBox="0 0 24 24"
                  fill="currentColor"
                >
                  <circle cx="12" cy="6" r="2" />
                  <circle cx="12" cy="12" r="2" />
                  <circle cx="12" cy="18" r="2" />
                </svg>
              </.icon_button>
            </.flex>
            <.grid columns={%{xs: "1", sm: "2", md: "4"}} gap="4">
              <.flex gap="3" align="center">
                <div style="width: 48px; height: 48px; background: #1e40af; border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="#3b82f6"
                    stroke-width="2"
                  >
                    <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                    <circle cx="9" cy="7" r="4" />
                    <path d="M22 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75" />
                  </svg>
                </div>
                <.flex direction="column" gap="1">
                  <.text size="1" color="gray">Total Customers</.text>
                  <.text size="5" weight="bold">5,120</.text>
                </.flex>
              </.flex>

              <.flex gap="3" align="center">
                <div style="width: 48px; height: 48px; background: #065f46; border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="#10b981"
                    stroke-width="2"
                  >
                    <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                    <circle cx="9" cy="7" r="4" />
                    <line x1="19" y1="8" x2="19" y2="14" />
                    <line x1="22" y1="11" x2="16" y2="11" />
                  </svg>
                </div>
                <.flex direction="column" gap="1">
                  <.text size="1" color="gray">New Customers</.text>
                  <.text size="5" weight="bold">45</.text>
                </.flex>
              </.flex>

              <.flex gap="3" align="center">
                <div style="width: 48px; height: 48px; background: #92400e; border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="#f59e0b"
                    stroke-width="2"
                  >
                    <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                    <circle cx="9" cy="7" r="4" />
                    <path d="M22 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75" />
                  </svg>
                </div>
                <.flex direction="column" gap="1">
                  <.text size="1" color="gray">Returning Customers</.text>
                  <.text size="5" weight="bold">150</.text>
                </.flex>
              </.flex>

              <.flex gap="3" align="center">
                <div style="width: 48px; height: 48px; background: #581c87; border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="#a855f7"
                    stroke-width="2"
                  >
                    <path d="M12 2L2 7l10 5 10-5-10-5z" />
                    <path d="M2 17l10 5 10-5M2 12l10 5 10-5" />
                  </svg>
                </div>
                <.flex direction="column" gap="1">
                  <.text size="1" color="gray">VIP Customers</.text>
                  <.text size="5" weight="bold">320</.text>
                </.flex>
              </.flex>
            </.grid>
          </.flex>
        </.card>
      </.flex>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
