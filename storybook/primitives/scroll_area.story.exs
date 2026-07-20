defmodule Storybook.Primitives.ScrollAreaStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.ScrollArea

  def function, do: &ScrollArea.root/1
  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless scroll area primitive",
        template: """
        <ScrollArea.root id="scroll-area-primitive" type="always" class="ScrollAreaRoot">
          <ScrollArea.viewport class="ScrollAreaViewport">
            <div style="padding: 15px; width: 100%;">
              <p style="margin: 0 0 8px;">Tag 1</p>
              <p style="margin: 0 0 8px;">Tag 2</p>
              <p style="margin: 0 0 8px;">Tag 3</p>
              <p style="margin: 0 0 8px;">Tag 4</p>
              <p style="margin: 0 0 8px;">Tag 5</p>
              <p style="margin: 0 0 8px;">Tag 6</p>
              <p style="margin: 0 0 8px;">Tag 7</p>
              <p style="margin: 0 0 8px;">Tag 8</p>
              <p style="margin: 0 0 8px;">Tag 9</p>
              <p style="margin: 0 0 8px;">Tag 10</p>
              <p style="margin: 0 0 8px;">Tag 11</p>
              <p style="margin: 0 0 8px;">Tag 12</p>
              <p style="margin: 0 0 8px;">Tag 13</p>
              <p style="margin: 0 0 8px;">Tag 14</p>
              <p style="margin: 0 0 8px;">Tag 15</p>
              <p style="margin: 0 0 8px;">Tag 16</p>
              <p style="margin: 0 0 8px;">Tag 17</p>
              <p style="margin: 0 0 8px;">Tag 18</p>
              <p style="margin: 0 0 8px;">Tag 19</p>
              <p style="margin: 0 0 8px;">Tag 20</p>
            </div>
          </ScrollArea.viewport>
          <ScrollArea.scrollbar orientation="vertical" class="ScrollAreaScrollbar">
            <ScrollArea.thumb class="ScrollAreaThumb" />
          </ScrollArea.scrollbar>
          <ScrollArea.corner />
        </ScrollArea.root>

        <style>
          .ScrollAreaRoot { border: 1px solid #ccc; border-radius: 4px; height: 150px; width: 200px; }
          .ScrollAreaViewport { border-radius: 4px; height: 100%; }
          .ScrollAreaScrollbar {
            display: flex; position: absolute; top: 0; right: 0; bottom: 0;
            width: 10px; background: #eee; padding: 2px;
          }
          .ScrollAreaScrollbar[data-state="hidden"] { opacity: 0; }
          .ScrollAreaThumb {
            flex: 1; background: #999; border-radius: 10px; position: relative;
            min-height: 20px;
          }
        </style>
        """
      }
    ]
  end
end
