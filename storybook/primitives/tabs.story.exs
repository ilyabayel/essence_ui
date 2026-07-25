defmodule Storybook.Primitives.TabsStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Tabs

  def function, do: &Tabs.root/1

  def container, do: {:div, class: "radix-demo", "data-component": "tabs"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Radix docs tabs demo",
        template: """
        <Tabs.root
          id="tabs-primitive"
          class="TabsRoot"
          default_value="tab1"
        >
          <Tabs.list
            class="TabsList"
            aria-label="Manage your account"
          >
            <Tabs.trigger
              class="TabsTrigger"
              value="tab1"
            >
              Account
            </Tabs.trigger>
            <Tabs.trigger
              class="TabsTrigger"
              value="tab2"
            >
              Password
            </Tabs.trigger>
          </Tabs.list>
          <Tabs.content
            class="TabsContent"
            value="tab1"
          >
            <p class="Text">
              Make changes to your account here. Click save when you're done.
            </p>
            <fieldset class="Fieldset">
              <label
                class="Label"
                for="name"
              >
                Name
              </label>
              <input
                class="Input"
                id="name"
                value="Pedro Duarte"
              />
            </fieldset>
            <fieldset class="Fieldset">
              <label
                class="Label"
                for="username"
              >
                Username
              </label>
              <input
                class="Input"
                id="username"
                value="@peduarte"
              />
            </fieldset>
            <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
              <button class="Button green">Save changes</button>
            </div>
          </Tabs.content>
          <Tabs.content
            class="TabsContent"
            value="tab2"
          >
            <p class="Text">
              Change your password here. After saving, you'll be logged out.
            </p>
            <fieldset class="Fieldset">
              <label
                class="Label"
                for="currentPassword"
              >
                Current password
              </label>
              <input
                class="Input"
                id="currentPassword"
                type="password"
              />
            </fieldset>
            <fieldset class="Fieldset">
              <label
                class="Label"
                for="newPassword"
              >
                New password
              </label>
              <input
                class="Input"
                id="newPassword"
                type="password"
              />
            </fieldset>
            <fieldset class="Fieldset">
              <label
                class="Label"
                for="confirmPassword"
              >
                Confirm password
              </label>
              <input
                class="Input"
                id="confirmPassword"
                type="password"
              />
            </fieldset>
            <div style="display: flex; margin-top: 20px; justify-content: flex-end;">
              <button class="Button green">Change password</button>
            </div>
          </Tabs.content>
        </Tabs.root>
        """
      }
    ]
  end
end
