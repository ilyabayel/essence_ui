defmodule Storybook.Components.Spinner do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.spinner/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: grid; gap: 16px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def imports, do: [{EssenceUI.Components, [box: 1, text: 1, flex: 1]}]

  def variations do
    [
      %Variation{
        id: :default,
        template: """
        <.box p="4">
          <.spinner />
        </.box>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different sizes",
        template: """
        <.flex gap="3" align="center" p="4">
          <.box>
            <.text size="1">Size 1</.text>
            <.spinner size="1" />
          </.box>
          <.box>
            <.text size="2">Size 2</.text>
            <.spinner size="2" />
          </.box>
          <.box>
            <.text size="3">Size 3</.text>
            <.spinner size="3" />
          </.box>
        </.flex>
        """
      },
      %Variation{
        id: :with_text,
        description: "Spinner with loading text",
        template: """
        <.flex gap="2" align="center" p="4">
          <.spinner size="2" />
          <.text size="2">Loading...</.text>
        </.flex>
        """
      },
      %Variation{
        id: :loading_states,
        description: "Loading vs stopped states",
        template: """
        <.flex gap="4" align="center" p="4">
          <.box>
            <.text size="2">Loading</.text>
            <.spinner loading={true} />
          </.box>
          <.box>
            <.text size="2">Stopped</.text>
            <.spinner loading={false} />
          </.box>
        </.flex>
        """
      }
    ]
  end
end
