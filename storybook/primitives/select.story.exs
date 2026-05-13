defmodule Storybook.Primitives.Select do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Select

  def function, do: &Select.root/1

  def layout, do: :one_column

  def imports,
    do: [
      {Select, trigger: 1},
      {Select, value: 1},
      {Select, icon: 1},
      {Select, content: 1},
      {Select, viewport: 1},
      {Select, item: 1},
      {Select, item_text: 1},
      {Select, item_indicator: 1},
      {Select, label: 1},
      {Select, separator: 1}
    ]

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Select primitive",
        template: """
        <div>
          <.root id="select-primitive">
            <.trigger id="select-primitive-trigger" style="border: 1px solid #ccc; padding: 4px 8px; border-radius: 4px; display: flex; align-items: center; gap: 8px;">
              <.value placeholder="Select fruit..." />
              <.icon>▼</.icon>
            </.trigger>
            <.content id="select-primitive-content">
              <.viewport>
                <.item value="apple" style="padding: 4px 24px; cursor: default; position: relative;">
                  <.item_indicator style="position: absolute; left: 4px;">✓</.item_indicator>
                  <.item_text>Apple</.item_text>
                </.item>
                <.item value="orange" style="padding: 4px 24px; cursor: default; position: relative;">
                  <.item_indicator style="position: absolute; left: 4px;">✓</.item_indicator>
                  <.item_text>Orange</.item_text>
                </.item>
                <.separator style="height: 1px; background: #eee; margin: 4px 0;" />
                <.label style="padding: 4px 24px; font-weight: bold; font-size: 0.8em;">Vegetables</.label>
                <.item value="carrot" style="padding: 4px 24px; cursor: default; position: relative;">
                  <.item_indicator style="position: absolute; left: 4px;">✓</.item_indicator>
                  <.item_text>Carrot</.item_text>
                </.item>
              </.viewport>
            </.content>
          </.root>

          <style>
            #select-primitive-content {
              background: white;
              border: 1px solid #ccc;
              border-radius: 4px;
              box-shadow: 0 2px 10px rgba(0,0,0,0.1);
              padding: 4px;
            }
          </style>
        </div>
        """
      }
    ]
  end
end
