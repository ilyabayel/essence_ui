defmodule EssenceUIWeb.Storybook.Layout.Container do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Container

  def function, do: &Container.container/1

  def container, do: {:div, "data-scaling": "100%", "data-radius": "medium"}

  def layout, do: :one_column

  def imports, do: [{EssenceUIWeb.DecorationBox, decoration_box: 1}]

  def args do
    [
      as: "div",
      as_child: nil,
      size: "4",
      display: nil,
      align: nil,
      width: nil,
      min_width: nil,
      max_width: nil,
      height: nil,
      min_height: nil,
      max_height: nil,
      m: nil,
      mt: nil,
      mr: nil,
      mb: nil,
      ml: nil,
      mx: nil,
      my: nil,
      class: nil,
      style: nil,
      rest: nil,
      inner_block: """
        <div style=\"background:var(--gray-a3);padding:16px;text-align:center\">Container content</div>
      """
    ]
  end

  def argTypes do
    [
      as: [type: :string, options: ["div"], default: "div", description: "The element to render"],
      as_child: [
        type: :boolean,
        description: "Composes the component into its immediate child instead of rendering its own HTML element"
      ],
      size: [
        type: :string,
        options: ["1", "2", "3", "4"],
        default: "4",
        description: "Controls the max-width of the content. Responsive supported."
      ],
      display: [
        type: :string,
        options: [nil, "none", "initial"],
        description: "Controls whether the container is visible or hidden. Responsive supported."
      ],
      align: [
        type: :string,
        options: [nil, "left", "center", "right"],
        description: "Controls the alignment of the content. Responsive supported."
      ],
      width: [type: :string, description: "Width utility class or value"],
      min_width: [type: :string, description: "Min width utility class or value"],
      max_width: [type: :string, description: "Max width utility class or value"],
      height: [type: :string, description: "Height utility class or value"],
      min_height: [type: :string, description: "Min height utility class or value"],
      max_height: [type: :string, description: "Max height utility class or value"],
      m: [type: :string, description: "Margin utility class (theme scale)"],
      mt: [type: :string, description: "Margin top"],
      mr: [type: :string, description: "Margin right"],
      mb: [type: :string, description: "Margin bottom"],
      ml: [type: :string, description: "Margin left"],
      mx: [type: :string, description: "Margin X axis"],
      my: [type: :string, description: "Margin Y axis"],
      class: [type: :string, description: "Additional CSS classes"],
      style: [type: :string, description: "Additional inline styles"],
      rest: [type: :any, description: "Additional HTML attributes"],
      inner_block: [type: :string, description: "Container content"]
    ]
  end

  def variations do
    [
      %Variation{
        id: :size_1,
        description: "Container with size 1",
        attributes: %{size: "1", width: "100%"},
        slots: [
          """
          <.decoration_box/>
          """
        ]
      },
      %Variation{
        id: :size_2,
        description: "Container with size 2",
        attributes: %{size: "2", width: "100%"},
        slots: [
          """
          <.decoration_box/>
          """
        ]
      },
      %Variation{
        id: :size_3,
        description: "Container with size 3",
        attributes: %{size: "3", width: "100%"},
        slots: [
          """
          <.decoration_box/>
          """
        ]
      },
      %Variation{
        id: :size_4,
        description: "Container with size 4",
        attributes: %{size: "4", width: "100%"},
        slots: [
          """
          <.decoration_box/>
          """
        ]
      }
    ]
  end
end
