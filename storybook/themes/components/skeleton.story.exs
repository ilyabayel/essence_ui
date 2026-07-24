defmodule Storybook.Themes.Components.Skeleton do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Skeleton.skeleton/1

  def imports, do: [{EssenceUI.Components, flex: 1, button: 1, text: 1, switch: 1, container: 1}]

  def layout, do: :one_column

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: flex; align-items: start;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default skeleton",
        slots: ["Loading..."]
      },
      %Variation{
        id: :explicit_size,
        description: "Skeleton with explicit width and height",
        attributes: %{
          width: "200px",
          height: "20px"
        }
      },
      %Variation{
        id: :with_children,
        description: "Skeleton with children",
        template: """
        <.flex>
          <.skeleton loading={true}>
            <.switch checked />
          </.skeleton>
          <.skeleton loading={false}>
            <.switch checked />
          </.skeleton>
        </.flex>
        """
      },
      %Variation{
        id: :text_skeleton,
        description: "With text",
        template: """
        <.flex direction="column" gap="3">
          <.text>
            <.skeleton>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            </.skeleton>
          </.text>

          <.skeleton>
            <.text>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit.
            </.text>
          </.skeleton>
        </.flex>
        """
      },
      %Variation{
        id: :text_loaded,
        description: "The difference is especially noticeable when wrapping longer paragraphs",
        template: """
        <.container size="1">
        	<.flex direction="column" gap="3">
        		<.text>
        			<.skeleton>
        				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
        				felis tellus, efficitur id convallis a, viverra eget libero. Nam magna
        				erat, fringilla sed commodo sed, aliquet nec magna.
        			</.skeleton>
        		</.text>

        		<.skeleton>
        			<.text>
        				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque
        				felis tellus, efficitur id convallis a, viverra eget libero. Nam magna
        				erat, fringilla sed commodo sed, aliquet nec magna.
        			</.text>
        		</.skeleton>
        	</.flex>
        </.container>
        """
      }
    ]
  end
end
