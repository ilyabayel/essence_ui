defmodule Storybook.Primitives.TabsStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Tabs

  def function, do: &Tabs.root/1

  def container, do: {:div, class: "essence-demo", "data-component": "tabs"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Essence UI tabs demo",
        template: """
        <Tabs.root
          id="tabs-primitive"
          class="DemoTabsRoot"
          default_value="tab1"
        >
          <Tabs.list
            class="DemoTabsList"
            aria-label="Manage your account"
          >
            <Tabs.trigger
              class="DemoTabsTrigger"
              value="tab1"
            >
              Account
            </Tabs.trigger>
            <Tabs.trigger
              class="DemoTabsTrigger"
              value="tab2"
            >
              Password
            </Tabs.trigger>
          </Tabs.list>
          <Tabs.content
            class="DemoTabsContent"
            value="tab1"
          >
            <p class="DemoText">
              Make changes to your account here. Click save when you're done.
            </p>
            <fieldset class="DemoFieldset">
              <label
                class="DemoLabel"
                for="name"
              >
                Name
              </label>
              <input
                class="DemoInput"
                id="name"
                value="Pedro Duarte"
              />
            </fieldset>
            <fieldset class="DemoFieldset">
              <label
                class="DemoLabel"
                for="username"
              >
                Username
              </label>
              <input
                class="DemoInput"
                id="username"
                value="@peduarte"
              />
            </fieldset>
            <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
              <button class="DemoButton green">Save changes</button>
            </div>
          </Tabs.content>
          <Tabs.content
            class="DemoTabsContent"
            value="tab2"
          >
            <p class="DemoText">
              Change your password here. After saving, you'll be logged out.
            </p>
            <fieldset class="DemoFieldset">
              <label
                class="DemoLabel"
                for="currentPassword"
              >
                Current password
              </label>
              <input
                class="DemoInput"
                id="currentPassword"
                type="password"
              />
            </fieldset>
            <fieldset class="DemoFieldset">
              <label
                class="DemoLabel"
                for="newPassword"
              >
                New password
              </label>
              <input
                class="DemoInput"
                id="newPassword"
                type="password"
              />
            </fieldset>
            <fieldset class="DemoFieldset">
              <label
                class="DemoLabel"
                for="confirmPassword"
              >
                Confirm password
              </label>
              <input
                class="DemoInput"
                id="confirmPassword"
                type="password"
              />
            </fieldset>
            <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
              <button class="DemoButton green">Change password</button>
            </div>
          </Tabs.content>
        </Tabs.root>
        """
      }
    ]
  end
end
