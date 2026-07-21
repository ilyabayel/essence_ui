defmodule Storybook.Primitives.ToastStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Toast

  def function, do: &Toast.provider/1
  def container, do: :div
  def layout, do: :one_column

  def imports,
    do: [
      {Toast, root: 1},
      {Toast, title: 1},
      {Toast, description: 1},
      {Toast, action: 1},
      {Toast, close: 1},
      {Toast, viewport: 1}
    ]

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless toast primitive",
        template: """
        <div class="radix-demo" data-component="toast">
          <.provider duration={8000} swipe_direction="right" label="Notification">
            <button
              type="button"
              id="toast-show-btn"
              class="Button large violet"
              onclick="
                const toast = document.getElementById('toast-primitive');
                if (!toast) return;
                toast.hidden = false;
                toast.dataset.state = 'open';
                toast.dispatchEvent(new CustomEvent('essence:toast:open', {bubbles: true}));
              "
            >
              Add to calendar
            </button>

            <.viewport id="toast-viewport" class="ToastViewport">
              <.root id="toast-primitive" duration={3000} type="foreground" default_open={false} class="ToastRoot">
                <.title class="ToastTitle">
                  Scheduled: Catch up
                </.title>
                <.description class="ToastDescription">
                  Friday at 5:30 PM
                </.description>
                <.action alt_text="Goto schedule to undo" class="ToastAction Button small green">
                  Undo
                </.action>
              </.root>
            </.viewport>
          </.provider>
        </div>
        """
      }
    ]
  end
end
