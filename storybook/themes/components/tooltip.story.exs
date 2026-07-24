defmodule Storybook.Themes.Components.Tooltip do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.tooltip/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def imports, do: [{EssenceUI.Components, [button: 1, icon_button: 1, box: 1, text: 1, flex: 1]}]

  def variations do
    [
      %Variation{
        id: :default,
        template: """
        <.box p="4">
          <.tooltip content="This is a tooltip">
            <.button>Hover me</.button>
          </.tooltip>
        </.box>
        """
      },
      %Variation{
        id: :sides,
        description: "Different tooltip placements",
        template: """
        <.box p="8" class="grid grid-cols-2 gap-4">
          <.tooltip content="Top tooltip" side="top">
            <.button>Top</.button>
          </.tooltip>
          <.tooltip content="Right tooltip" side="right">
            <.button>Right</.button>
          </.tooltip>
          <.tooltip content="Bottom tooltip" side="bottom">
            <.button>Bottom</.button>
          </.tooltip>
          <.tooltip content="Left tooltip" side="left">
            <.button>Left</.button>
          </.tooltip>
        </.box>
        """
      },
      %Variation{
        id: :alignments,
        description: "Different tooltip alignments",
        template: """
        <.box p="8" class="space-y-4">
          <.flex gap="3">
            <.tooltip content="Start aligned" side="top" align="start">
              <.button>Start</.button>
            </.tooltip>
            <.tooltip content="Center aligned" side="top" align="center">
              <.button>Center</.button>
            </.tooltip>
            <.tooltip content="End aligned" side="top" align="end">
              <.button>End</.button>
            </.tooltip>
          </.flex>
        </.box>
        """
      },
      %Variation{
        id: :with_icon_button,
        description: "Tooltip with icon button",
        template: """
        <.box p="4">
          <.tooltip content="Information about this feature">
            <.icon_button variant="ghost">
              <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M7.49991 0.877045C3.84222 0.877045 0.877075 3.84219 0.877075 7.49988C0.877075 11.1575 3.84222 14.1227 7.49991 14.1227C11.1576 14.1227 14.1227 11.1575 14.1227 7.49988C14.1227 3.84219 11.1576 0.877045 7.49991 0.877045ZM1.82708 7.49988C1.82708 4.36686 4.36689 1.82704 7.49991 1.82704C10.6329 1.82704 13.1727 4.36686 13.1727 7.49988C13.1727 10.6329 10.6329 13.1727 7.49991 13.1727C4.36689 13.1727 1.82708 10.6329 1.82708 7.49988ZM8.24992 4.49999C8.24992 4.9142 7.91413 5.24999 7.49992 5.24999C7.08571 5.24999 6.74992 4.9142 6.74992 4.49999C6.74992 4.08578 7.08571 3.74999 7.49992 3.74999C7.91413 3.74999 8.24992 4.08578 8.24992 4.49999ZM6.00003 5.99999H6.50003H7.50003C7.77618 5.99999 8.00003 6.22384 8.00003 6.49999V9.99999H8.50003H9.00003V11H8.50003H7.50003H6.50003H6.00003V9.99999H6.50003H7.00003V6.99999H6.50003H6.00003V5.99999Z" fill="currentColor" fill-rule="evenodd" clip-rule="evenodd"></path>
              </svg>
            </.icon_button>
          </.tooltip>
        </.box>
        """
      },
      %Variation{
        id: :delays,
        description: "Custom open and close delays",
        template: """
        <.box p="4" class="space-y-4">
          <.tooltip content="Fast tooltip (300ms open)" open_delay={300}>
            <.button>Fast tooltip</.button>
          </.tooltip>
          <.tooltip content="Normal tooltip (700ms open)" open_delay={700}>
            <.button>Normal tooltip</.button>
          </.tooltip>
          <.tooltip content="Slow tooltip (1500ms open)" open_delay={1500}>
            <.button>Slow tooltip</.button>
          </.tooltip>
        </.box>
        """
      },
      %Variation{
        id: :colors,
        description: "Different tooltip colors",
        template: """
        <.box p="4" class="space-y-4">
          <.tooltip content="Red tooltip" color="red">
            <.button color="red">Red tooltip</.button>
          </.tooltip>
          <.tooltip content="Blue tooltip" color="blue">
            <.button color="blue">Blue tooltip</.button>
          </.tooltip>
          <.tooltip content="Green tooltip" color="green">
            <.button color="green">Green tooltip</.button>
          </.tooltip>
        </.box>
        """
      }
    ]
  end
end
