defmodule Storybook.Themes.Utilities.AccessibleIcon do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Utilities.AccessibleIcon

  def layout, do: :one_column

  def function, do: &AccessibleIcon.accessible_icon/1

  def imports, do: [{EssenceUI.Components.Button, button: 1}]

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
        description: "Icon wrapper with accessible label",
        template: """
        <.button variant="soft">
          <.accessible_icon label="Edit current user profile">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" />
              <path d="M18.5 2.5a2.121 2.121 0 1 1 3 3L12 15l-4 1 1-4 9.5-9.5z" />
            </svg>
          </.accessible_icon>
          Edit
        </.button>
        """
      }
    ]
  end
end
