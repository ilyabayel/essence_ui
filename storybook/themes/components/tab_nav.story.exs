defmodule Storybook.Themes.Components.TabNav do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.TabNav

  def function, do: &TabNav.tab_nav/1

  def imports, do: [{TabNav, tab_nav_link: 1}]

  def layout, do: :one_column

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 32px; padding: 40px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Basic tab navigation",
        template: """
        <.tab_nav>
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different sizes",
        template: """
        <div style="display: flex; flex-direction: column; gap: 24px;">
          <.tab_nav size="1">
            <.tab_nav_link href="#" active>Account</.tab_nav_link>
            <.tab_nav_link href="#">Documents</.tab_nav_link>
            <.tab_nav_link href="#">Settings</.tab_nav_link>
          </.tab_nav>

          <.tab_nav size="2">
            <.tab_nav_link href="#" active>Account</.tab_nav_link>
            <.tab_nav_link href="#">Documents</.tab_nav_link>
            <.tab_nav_link href="#">Settings</.tab_nav_link>
          </.tab_nav>
        </div>
        """
      },
      %Variation{
        id: :colors,
        description: "Different colors",
        template: """
        <div style="display: flex; flex-direction: column; gap: 24px;">
          <.tab_nav color="crimson">
            <.tab_nav_link href="#" active>Account</.tab_nav_link>
            <.tab_nav_link href="#">Documents</.tab_nav_link>
            <.tab_nav_link href="#">Settings</.tab_nav_link>
          </.tab_nav>

          <.tab_nav color="teal">
            <.tab_nav_link href="#" active>Account</.tab_nav_link>
            <.tab_nav_link href="#">Documents</.tab_nav_link>
            <.tab_nav_link href="#">Settings</.tab_nav_link>
          </.tab_nav>
        </div>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast",
        template: """
        <.tab_nav high_contrast color="crimson">
          <.tab_nav_link href="#" active>Account</.tab_nav_link>
          <.tab_nav_link href="#">Documents</.tab_nav_link>
          <.tab_nav_link href="#">Settings</.tab_nav_link>
        </.tab_nav>
        """
      },
      %Variation{
        id: :justify,
        description: "Different alignment (justify)",
        template: """
        <div style="display: flex; flex-direction: column; gap: 24px;">
          <.tab_nav justify="start">
            <.tab_nav_link href="#" active>Account</.tab_nav_link>
            <.tab_nav_link href="#">Documents</.tab_nav_link>
            <.tab_nav_link href="#">Settings</.tab_nav_link>
          </.tab_nav>

          <.tab_nav justify="center">
            <.tab_nav_link href="#" active>Account</.tab_nav_link>
            <.tab_nav_link href="#">Documents</.tab_nav_link>
            <.tab_nav_link href="#">Settings</.tab_nav_link>
          </.tab_nav>

          <.tab_nav justify="end">
            <.tab_nav_link href="#" active>Account</.tab_nav_link>
            <.tab_nav_link href="#">Documents</.tab_nav_link>
            <.tab_nav_link href="#">Settings</.tab_nav_link>
          </.tab_nav>
        </div>
        """
      },
      %Variation{
        id: :wrap,
        description: "Wrapping behavior",
        template: """
        <div style="width: 250px; border: 1px solid var(--gray-5); padding: 8px;">
          <.tab_nav wrap="wrap">
            <.tab_nav_link href="#" active>Account</.tab_nav_link>
            <.tab_nav_link href="#">Documents</.tab_nav_link>
            <.tab_nav_link href="#">Settings</.tab_nav_link>
            <.tab_nav_link href="#">Notifications</.tab_nav_link>
            <.tab_nav_link href="#">Profile</.tab_nav_link>
          </.tab_nav>
        </div>
        """
      }
    ]
  end
end
