defmodule Storybook.Components.TabsStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Tabs

  def function, do: &Tabs.tabs/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def imports, do: [{EssenceUI.Components.Text, text: 1}, {EssenceUI.Components.Box, box: 1}, {Tabs, tabs_list: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default tabs",
        template: """
        <.tabs default_value="account">
          <:list :let={ctx}>
            <.tabs_list size="2" tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="account">Account</:trigger>
              <:trigger value="documents">Documents</:trigger>
              <:trigger value="settings">Settings</:trigger>
            </.tabs_list>
          </:list>
          <:content value="account">
            <.box pt="3">
              <.text>Make changes to your account here. Click save when you're done.</.text>
            </.box>
          </:content>
          <:content value="documents">
            <.box pt="3">
              <.text>Access and update your documents. Your documents are stored securely.</.text>
            </.box>
          </:content>
          <:content value="settings">
            <.box pt="3">
              <.text>Edit your profile or update contact information. Changes will be saved automatically.</.text>
            </.box>
          </:content>
        </.tabs>
        """
      },
      %Variation{
        id: :sizes,
        description: "Tab sizes",
        template: """
        <.box mb="5">
          <.text size="2" weight="bold" mb="2">Size 1</.text>
          <.tabs default_value="tab1">
            <:list :let={ctx}>
              <.tabs_list size="1" tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
                <:trigger value="tab1">Tab 1</:trigger>
                <:trigger value="tab2">Tab 2</:trigger>
                <:trigger value="tab3">Tab 3</:trigger>
              </.tabs_list>
            </:list>
            <:content value="tab1">
              <.box pt="2"><.text size="1">Content for tab 1</.text></.box>
            </:content>
            <:content value="tab2">
              <.box pt="2"><.text size="1">Content for tab 2</.text></.box>
            </:content>
            <:content value="tab3">
              <.box pt="2"><.text size="1">Content for tab 3</.text></.box>
            </:content>
          </.tabs>
        </.box>

        <.box>
          <.text size="2" weight="bold" mb="2">Size 2 (default)</.text>
          <.tabs default_value="tab1">
            <:list :let={ctx}>
              <.tabs_list size="2" tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
                <:trigger value="tab1">Tab 1</:trigger>
                <:trigger value="tab2">Tab 2</:trigger>
                <:trigger value="tab3">Tab 3</:trigger>
              </.tabs_list>
            </:list>
            <:content value="tab1">
              <.box pt="3"><.text>Content for tab 1</.text></.box>
            </:content>
            <:content value="tab2">
              <.box pt="3"><.text>Content for tab 2</.text></.box>
            </:content>
            <:content value="tab3">
              <.box pt="3"><.text>Content for tab 3</.text></.box>
            </:content>
          </.tabs>
        </.box>
        """
      },
      %Variation{
        id: :colors,
        description: "Tab colors",
        template: """
        <.box mb="5">
          <.text weight="bold" mb="2">Blue</.text>
          <.tabs default_value="overview" color="blue">
            <:list :let={ctx}>
              <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
                <:trigger value="overview">Overview</:trigger>
                <:trigger value="details">Details</:trigger>
              </.tabs_list>
            </:list>
            <:content value="overview">
              <.box pt="3"><.text>Overview content</.text></.box>
            </:content>
            <:content value="details">
              <.box pt="3"><.text>Details content</.text></.box>
            </:content>
          </.tabs>
        </.box>

        <.box mb="5">
          <.text weight="bold" mb="2">Green</.text>
          <.tabs default_value="overview" color="green">
            <:list :let={ctx}>
              <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
                <:trigger value="overview">Overview</:trigger>
                <:trigger value="details">Details</:trigger>
              </.tabs_list>
            </:list>
            <:content value="overview">
              <.box pt="3"><.text>Overview content</.text></.box>
            </:content>
            <:content value="details">
              <.box pt="3"><.text>Details content</.text></.box>
            </:content>
          </.tabs>
        </.box>

        <.box mb="5">
          <.text weight="bold" mb="2">Red</.text>
          <.tabs default_value="overview" color="red">
            <:list :let={ctx}>
              <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
                <:trigger value="overview">Overview</:trigger>
                <:trigger value="details">Details</:trigger>
              </.tabs_list>
            </:list>
            <:content value="overview">
              <.box pt="3"><.text>Overview content</.text></.box>
            </:content>
            <:content value="details">
              <.box pt="3"><.text>Details content</.text></.box>
            </:content>
          </.tabs>
        </.box>

        <.box>
          <.text weight="bold" mb="2">Purple</.text>
          <.tabs default_value="overview" color="purple">
            <:list :let={ctx}>
              <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
                <:trigger value="overview">Overview</:trigger>
                <:trigger value="details">Details</:trigger>
              </.tabs_list>
            </:list>
            <:content value="overview">
              <.box pt="3"><.text>Overview content</.text></.box>
            </:content>
            <:content value="details">
              <.box pt="3"><.text>Details content</.text></.box>
            </:content>
          </.tabs>
        </.box>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast tabs",
        template: """
        <.tabs default_value="features" color="crimson" high_contrast>
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value} high_contrast={ctx.high_contrast}>
              <:trigger value="features">Features</:trigger>
              <:trigger value="pricing">Pricing</:trigger>
              <:trigger value="support">Support</:trigger>
            </.tabs_list>
          </:list>
          <:content value="features">
            <.box pt="3">
              <.text>Discover all the amazing features we offer.</.text>
            </.box>
          </:content>
          <:content value="pricing">
            <.box pt="3">
              <.text>Find the perfect plan for your needs.</.text>
            </.box>
          </:content>
          <:content value="support">
            <.box pt="3">
              <.text>Get help from our support team.</.text>
            </.box>
          </:content>
        </.tabs>
        """
      },
      %Variation{
        id: :disabled_tabs,
        description: "Tabs with disabled trigger",
        template: """
        <.tabs default_value="enabled">
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="enabled">Enabled</:trigger>
              <:trigger value="disabled" disabled>Disabled</:trigger>
              <:trigger value="also_enabled">Also Enabled</:trigger>
            </.tabs_list>
          </:list>
          <:content value="enabled">
            <.box pt="3">
              <.text>This tab is enabled and accessible.</.text>
            </.box>
          </:content>
          <:content value="disabled">
            <.box pt="3">
              <.text>This tab is disabled and cannot be accessed.</.text>
            </.box>
          </:content>
          <:content value="also_enabled">
            <.box pt="3">
              <.text>This tab is also enabled.</.text>
            </.box>
          </:content>
        </.tabs>
        """
      },
      %Variation{
        id: :with_complex_content,
        description: "Tabs with rich content",
        template: """
        <.tabs default_value="profile">
          <:list :let={ctx}>
            <.tabs_list tabs_id={ctx.tabs_id} default_value={ctx.default_value}>
              <:trigger value="profile">Profile</:trigger>
              <:trigger value="notifications">Notifications</:trigger>
              <:trigger value="security">Security</:trigger>
            </.tabs_list>
          </:list>
          <:content value="profile">
            <.box pt="4">
              <.text size="4" weight="bold" mb="3">User Profile</.text>
              <.text mb="2">Name: John Doe</.text>
              <.text mb="2">Email: john@example.com</.text>
              <.text>Member since: January 2024</.text>
            </.box>
          </:content>
          <:content value="notifications">
            <.box pt="4">
              <.text size="4" weight="bold" mb="3">Notification Settings</.text>
              <.text mb="2">✓ Email notifications</.text>
              <.text mb="2">✓ Push notifications</.text>
              <.text>✗ SMS notifications</.text>
            </.box>
          </:content>
          <:content value="security">
            <.box pt="4">
              <.text size="4" weight="bold" mb="3">Security Settings</.text>
              <.text mb="2">Two-factor authentication: Enabled</.text>
              <.text mb="2">Last password change: 30 days ago</.text>
              <.text>Active sessions: 2</.text>
            </.box>
          </:content>
        </.tabs>
        """
      }
    ]
  end
end
