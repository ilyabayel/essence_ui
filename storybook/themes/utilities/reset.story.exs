defmodule Storybook.Themes.Utilities.Reset do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Utilities.Reset

  def layout, do: :one_column

  def function, do: &Reset.reset/1

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "padding: 40px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Resetting styles for children",
        template: """
        <div style="color: var(--accent-9); font-weight: bold;">
          <p>This text inherits parent styles.</p>
          <.reset>
            <p>This text is reset to default browser/base styles.</p>
            <button style="border: 1px solid currentColor; padding: 2px 8px;">Reset Button</button>
          </.reset>
        </div>
        """
      }
    ]
  end
end
