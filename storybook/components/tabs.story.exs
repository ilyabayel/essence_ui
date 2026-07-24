defmodule Storybook.Components.TabsStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Tabs

  def function, do: &Tabs.tabs_root/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def imports,
    do: [
      {EssenceUI.Components.Text, text: 1},
      {EssenceUI.Components.Box, box: 1},
      {Tabs, [tabs_list: 1, tabs_trigger: 1, tabs_content: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default tabs",
        template: """
        <.tabs_root id="tabs-default" default_value="account">
          <.tabs_list size="2">
            <.tabs_trigger value="account">Account</.tabs_trigger>
            <.tabs_trigger value="documents">Documents</.tabs_trigger>
            <.tabs_trigger value="settings">Settings</.tabs_trigger>
          </.tabs_list>
          <.tabs_content value="account">
            <.box pt="3">
              <.text>Make changes to your account here. Click save when you're done.</.text>
            </.box>
          </.tabs_content>
          <.tabs_content value="documents">
            <.box pt="3">
              <.text>Access and update your documents. Your documents are stored securely.</.text>
            </.box>
          </.tabs_content>
          <.tabs_content value="settings">
            <.box pt="3">
              <.text>Edit your profile or update contact information. Changes will be saved automatically.</.text>
            </.box>
          </.tabs_content>
        </.tabs_root>
        """
      },
      %Variation{
        id: :sizes,
        description: "Tab sizes",
        template: """
        <.box mb="5">
          <.text size="2" weight="bold" mb="2">Size 1</.text>
          <.tabs_root id="tabs-size-1" default_value="tab1">
            <.tabs_list size="1">
              <.tabs_trigger value="tab1">Tab 1</.tabs_trigger>
              <.tabs_trigger value="tab2">Tab 2</.tabs_trigger>
              <.tabs_trigger value="tab3">Tab 3</.tabs_trigger>
            </.tabs_list>
            <.tabs_content value="tab1">
              <.box pt="2"><.text size="1">Content for tab 1</.text></.box>
            </.tabs_content>
            <.tabs_content value="tab2">
              <.box pt="2"><.text size="1">Content for tab 2</.text></.box>
            </.tabs_content>
            <.tabs_content value="tab3">
              <.box pt="2"><.text size="1">Content for tab 3</.text></.box>
            </.tabs_content>
          </.tabs_root>
        </.box>

        <.box>
          <.text size="2" weight="bold" mb="2">Size 2 (default)</.text>
          <.tabs_root id="tabs-size-2" default_value="tab1">
            <.tabs_list size="2">
              <.tabs_trigger value="tab1">Tab 1</.tabs_trigger>
              <.tabs_trigger value="tab2">Tab 2</.tabs_trigger>
              <.tabs_trigger value="tab3">Tab 3</.tabs_trigger>
            </.tabs_list>
            <.tabs_content value="tab1">
              <.box pt="3"><.text>Content for tab 1</.text></.box>
            </.tabs_content>
            <.tabs_content value="tab2">
              <.box pt="3"><.text>Content for tab 2</.text></.box>
            </.tabs_content>
            <.tabs_content value="tab3">
              <.box pt="3"><.text>Content for tab 3</.text></.box>
            </.tabs_content>
          </.tabs_root>
        </.box>
        """
      },
      %Variation{
        id: :colors,
        description: "Tab colors",
        template: """
        <.box mb="5">
          <.text weight="bold" mb="2">Blue</.text>
          <.tabs_root id="tabs-blue" default_value="overview">
            <.tabs_list color="blue">
              <.tabs_trigger value="overview">Overview</.tabs_trigger>
              <.tabs_trigger value="details">Details</.tabs_trigger>
            </.tabs_list>
            <.tabs_content value="overview">
              <.box pt="3"><.text>Overview content</.text></.box>
            </.tabs_content>
            <.tabs_content value="details">
              <.box pt="3"><.text>Details content</.text></.box>
            </.tabs_content>
          </.tabs_root>
        </.box>

        <.box mb="5">
          <.text weight="bold" mb="2">Green</.text>
          <.tabs_root id="tabs-green" default_value="overview">
            <.tabs_list color="green">
              <.tabs_trigger value="overview">Overview</.tabs_trigger>
              <.tabs_trigger value="details">Details</.tabs_trigger>
            </.tabs_list>
            <.tabs_content value="overview">
              <.box pt="3"><.text>Overview content</.text></.box>
            </.tabs_content>
            <.tabs_content value="details">
              <.box pt="3"><.text>Details content</.text></.box>
            </.tabs_content>
          </.tabs_root>
        </.box>

        <.box mb="5">
          <.text weight="bold" mb="2">Red</.text>
          <.tabs_root id="tabs-red" default_value="overview">
            <.tabs_list color="red">
              <.tabs_trigger value="overview">Overview</.tabs_trigger>
              <.tabs_trigger value="details">Details</.tabs_trigger>
            </.tabs_list>
            <.tabs_content value="overview">
              <.box pt="3"><.text>Overview content</.text></.box>
            </.tabs_content>
            <.tabs_content value="details">
              <.box pt="3"><.text>Details content</.text></.box>
            </.tabs_content>
          </.tabs_root>
        </.box>

        <.box>
          <.text weight="bold" mb="2">Purple</.text>
          <.tabs_root id="tabs-purple" default_value="overview">
            <.tabs_list color="purple">
              <.tabs_trigger value="overview">Overview</.tabs_trigger>
              <.tabs_trigger value="details">Details</.tabs_trigger>
            </.tabs_list>
            <.tabs_content value="overview">
              <.box pt="3"><.text>Overview content</.text></.box>
            </.tabs_content>
            <.tabs_content value="details">
              <.box pt="3"><.text>Details content</.text></.box>
            </.tabs_content>
          </.tabs_root>
        </.box>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast tabs",
        template: """
        <.tabs_root id="tabs-hc" default_value="features">
          <.tabs_list color="crimson" high_contrast>
            <.tabs_trigger value="features">Features</.tabs_trigger>
            <.tabs_trigger value="pricing">Pricing</.tabs_trigger>
            <.tabs_trigger value="support">Support</.tabs_trigger>
          </.tabs_list>
          <.tabs_content value="features">
            <.box pt="3">
              <.text>Discover all the amazing features we offer.</.text>
            </.box>
          </.tabs_content>
          <.tabs_content value="pricing">
            <.box pt="3">
              <.text>Find the perfect plan for your needs.</.text>
            </.box>
          </.tabs_content>
          <.tabs_content value="support">
            <.box pt="3">
              <.text>Get help from our support team.</.text>
            </.box>
          </.tabs_content>
        </.tabs_root>
        """
      },
      %Variation{
        id: :disabled_tabs,
        description: "Tabs with disabled trigger",
        template: """
        <.tabs_root id="tabs-disabled" default_value="enabled">
          <.tabs_list>
            <.tabs_trigger value="enabled">Enabled</.tabs_trigger>
            <.tabs_trigger value="disabled" disabled>Disabled</.tabs_trigger>
            <.tabs_trigger value="also_enabled">Also Enabled</.tabs_trigger>
          </.tabs_list>
          <.tabs_content value="enabled">
            <.box pt="3">
              <.text>This tab is enabled and accessible.</.text>
            </.box>
          </.tabs_content>
          <.tabs_content value="disabled">
            <.box pt="3">
              <.text>This tab is disabled and cannot be accessed.</.text>
            </.box>
          </.tabs_content>
          <.tabs_content value="also_enabled">
            <.box pt="3">
              <.text>This tab is also enabled.</.text>
            </.box>
          </.tabs_content>
        </.tabs_root>
        """
      },
      %Variation{
        id: :with_complex_content,
        description: "Tabs with rich content",
        template: """
        <.tabs_root id="tabs-complex" default_value="profile">
          <.tabs_list>
            <.tabs_trigger value="profile">Profile</.tabs_trigger>
            <.tabs_trigger value="notifications">Notifications</.tabs_trigger>
            <.tabs_trigger value="security">Security</.tabs_trigger>
          </.tabs_list>
          <.tabs_content value="profile">
            <.box pt="4">
              <.text size="4" weight="bold" mb="3">User Profile</.text>
              <.text mb="2">Name: John Doe</.text>
              <.text mb="2">Email: john@example.com</.text>
              <.text>Member since: January 2024</.text>
            </.box>
          </.tabs_content>
          <.tabs_content value="notifications">
            <.box pt="4">
              <.text size="4" weight="bold" mb="3">Notification Settings</.text>
              <.text mb="2">✓ Email notifications</.text>
              <.text mb="2">✓ Push notifications</.text>
              <.text>✗ SMS notifications</.text>
            </.box>
          </.tabs_content>
          <.tabs_content value="security">
            <.box pt="4">
              <.text size="4" weight="bold" mb="3">Security Settings</.text>
              <.text mb="2">Two-factor authentication: Enabled</.text>
              <.text mb="2">Last password change: 30 days ago</.text>
              <.text>Active sessions: 2</.text>
            </.box>
          </.tabs_content>
        </.tabs_root>
        """
      }
    ]
  end
end
