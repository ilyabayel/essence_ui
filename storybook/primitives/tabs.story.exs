defmodule Storybook.Primitives.TabsStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Tabs

  def function, do: &Tabs.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless tabs primitive",
        template: """
        <Tabs.root id="tabs-primitive" default_value="account" class="TabsRoot">
          <Tabs.list class="TabsList" aria-label="Manage your account">
            <Tabs.trigger class="TabsTrigger" value="account">Account</Tabs.trigger>
            <Tabs.trigger class="TabsTrigger" value="documents">Documents</Tabs.trigger>
            <Tabs.trigger class="TabsTrigger" value="settings">Settings</Tabs.trigger>
          </Tabs.list>
          <Tabs.content class="TabsContent" value="account">
            Make changes to your account here.
          </Tabs.content>
          <Tabs.content class="TabsContent" value="documents">
            Access and update your documents.
          </Tabs.content>
          <Tabs.content class="TabsContent" value="settings">
            Edit your settings or preferences.
          </Tabs.content>
        </Tabs.root>

        <style>
          .TabsRoot { font-family: system-ui, sans-serif; width: 300px; }
          .TabsList { display: flex; border-bottom: 1px solid #ccc; }
          .TabsTrigger {
            all: unset; padding: 8px 16px; cursor: pointer;
            border-bottom: 2px solid transparent;
          }
          .TabsTrigger[data-state="active"] { border-bottom-color: #585ad4; color: #585ad4; }
          .TabsTrigger:focus { outline: 2px solid black; outline-offset: 2px; }
          .TabsContent { padding: 16px 0; }
        </style>
        """
      },
      %Variation{
        id: :vertical,
        description: "Vertical tabs",
        template: """
        <Tabs.root id="tabs-vertical" default_value="tab1" orientation="vertical" class="TabsRootVertical">
          <Tabs.list class="TabsListVertical" aria-label="Vertical tabs">
            <Tabs.trigger class="TabsTrigger" value="tab1">One</Tabs.trigger>
            <Tabs.trigger class="TabsTrigger" value="tab2">Two</Tabs.trigger>
          </Tabs.list>
          <Tabs.content class="TabsContent" value="tab1">First panel</Tabs.content>
          <Tabs.content class="TabsContent" value="tab2">Second panel</Tabs.content>
        </Tabs.root>

        <style>
          .TabsRootVertical { display: flex; gap: 16px; }
          .TabsListVertical { display: flex; flex-direction: column; }
        </style>
        """
      }
    ]
  end
end
