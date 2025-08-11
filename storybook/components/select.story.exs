defmodule Storybook.Components.SelectStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Components.Select

  def function, do: &Select.select/1

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def imports, do: [{EssenceUI.Components.Box, box: 1}]

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default select (closed)",
        template: """
        <.select placeholder="Select a fruit">
          <:option value="apple">Apple</:option>
          <:option value="banana">Banana</:option>
          <:option value="orange">Orange</:option>
        </.select>
        """
      },
      %Variation{
        id: :open,
        description: "Open select with content",
        template: """
        <.box mb="200px">
          <.select placeholder="Select a fruit" open>
            <:label>Fruits</:label>
            <:option value="apple" selected>Apple</:option>
            <:option value="banana">Banana</:option>
            <:option value="orange">Orange</:option>
            <:separator />
            <:label>Citrus</:label>
            <:option value="lemon">Lemon</:option>
          </.select>
        </.box>
        """
      },
      %Variation{
        id: :sizes,
        description: "Sizes",
        template: """
        <.select placeholder="Size 1" open size="1">
          <:option value="1">One</:option>
          <:option value="2" selected>Two</:option>
          <:option value="3">Three</:option>
        </.select>

        <.select placeholder="Size 2" open size="2">
          <:option value="1">One</:option>
          <:option value="2" selected>Two</:option>
          <:option value="3">Three</:option>
        </.select>

        <.select placeholder="Size 3" open size="3">
          <:option value="1">One</:option>
          <:option value="2" selected>Two</:option>
          <:option value="3">Three</:option>
        </.select>
        """
      },
      %Variation{
        id: :trigger_variants,
        description: "Trigger variants",
        template: """
        <div style="margin-bottom: 10rem;">
          <.select placeholder="Surface" open trigger_variant="surface">
            <:option value="a" selected>A</:option>
            <:option value="b">B</:option>
          </.select>
        </div>

        <.select placeholder="Classic" open trigger_variant="classic">
          <:option value="a" selected>A</:option>
          <:option value="b">B</:option>
        </.select>

        <.select placeholder="Soft" open trigger_variant="soft">
          <:option value="a" selected>A</:option>
          <:option value="b">B</:option>
        </.select>

        <.select placeholder="Ghost" open trigger_variant="ghost">
          <:option value="a" selected>A</:option>
          <:option value="b">B</:option>
        </.select>
        """
      },
      %Variation{
        id: :content_variants,
        description: "Menu variants",
        template: """
        <.select placeholder="Solid" open content_variant="solid">
          <:option value="a" selected>A</:option>
          <:option value="b">B</:option>
        </.select>

        <.select placeholder="Soft" open content_variant="soft">
          <:option value="a" selected>A</:option>
          <:option value="b">B</:option>
        </.select>
        """
      },
      %Variation{
        id: :disabled,
        description: "Disabled trigger",
        template: """
        <.select placeholder="Disabled" disabled>
          <:option value="x">X</:option>
        </.select>
        """
      }
    ]
  end
end
