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
        description: "Radix docs tabs demo",
        template: """
        <div class="radix-demo" data-component="tabs">
          <Tabs.root id="tabs-primitive" class="TabsRoot" default_value="account">
            <Tabs.list class="TabsList" aria-label="Manage your account">
              <Tabs.trigger class="TabsTrigger" value="account">Account</Tabs.trigger>
              <Tabs.trigger class="TabsTrigger" value="documents">Documents</Tabs.trigger>
              <Tabs.trigger class="TabsTrigger" value="settings">Settings</Tabs.trigger>
            </Tabs.list>
            <Tabs.content class="TabsContent" value="account">
              <p class="Text">Make changes to your account here. Click save when you are done.</p>
              <fieldset class="Fieldset">
                <label class="Label" for="name">Name</label>
                <input class="Input" id="name" value="Pedro Duarte" />
              </fieldset>
              <fieldset class="Fieldset">
                <label class="Label" for="username">Username</label>
                <input class="Input" id="username" value="@peduarte" />
              </fieldset>
              <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
                <button class="Button green" type="button">Save changes</button>
              </div>
            </Tabs.content>
            <Tabs.content class="TabsContent" value="documents">
              <p class="Text">Access and update your documents here.</p>
              <fieldset class="Fieldset">
                <label class="Label" for="doc-title">Title</label>
                <input class="Input" id="doc-title" value="Project brief" />
              </fieldset>
              <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
                <button class="Button green" type="button">Save documents</button>
              </div>
            </Tabs.content>
            <Tabs.content class="TabsContent" value="settings">
              <p class="Text">Edit your settings or preferences.</p>
              <fieldset class="Fieldset">
                <label class="Label" for="currentPassword">Current password</label>
                <input class="Input" id="currentPassword" type="password" />
              </fieldset>
              <fieldset class="Fieldset">
                <label class="Label" for="newPassword">New password</label>
                <input class="Input" id="newPassword" type="password" />
              </fieldset>
              <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
                <button class="Button green" type="button">Change password</button>
              </div>
            </Tabs.content>
          </Tabs.root>
        </div>
        """
      }
    ]
  end
end
