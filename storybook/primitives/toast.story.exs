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
        <.provider duration={8000} swipe_direction="right" label="Notification">
          <button
            type="button"
            id="toast-show-btn"
            style="margin-bottom: 1rem; padding: 8px 12px; border: 1px solid #ccc; border-radius: 4px; cursor: pointer;"
            onclick="
              const toast = document.getElementById('toast-primitive');
              if (!toast) return;
              toast.hidden = false;
              toast.dataset.state = 'open';
              toast.dispatchEvent(new CustomEvent('essence:toast:open', {bubbles: true}));
            "
          >
            Show toast
          </button>

          <.viewport id="toast-viewport" style="position: fixed; bottom: 0; right: 0; display: flex; flex-direction: column; gap: 10px; padding: 25px; width: 390px; max-width: 100vw; margin: 0; list-style: none; z-index: 100; outline: none;">
            <.root id="toast-primitive" duration={3000} type="foreground" style="position: relative; background: white; border: 1px solid #e2e2e2; border-radius: 6px; padding: 15px; box-shadow: 0 2px 10px rgba(0,0,0,0.12); display: grid; grid-template-areas: 'title action' 'description action'; grid-template-columns: auto max-content; column-gap: 15px; align-items: center;">
              <.title style="grid-area: title; font-weight: 500; font-size: 15px; margin-bottom: 5px;">
                Scheduled: Catch up
              </.title>
              <.description style="grid-area: description; margin: 0; color: #666; font-size: 13px; line-height: 1.3;">
                Friday at 5:30 PM
              </.description>
              <.action alt_text="Goto schedule to undo" style="grid-area: action; font-size: 12px; padding: 4px 10px; border: 1px solid #ccc; border-radius: 4px; background: white; cursor: pointer;">
                Undo
              </.action>
              <.close aria-label="Close" style="position: absolute; top: 8px; right: 8px; border: none; background: transparent; cursor: pointer; font-size: 16px; line-height: 1;">
                ×
              </.close>
            </.root>
          </.viewport>
        </.provider>
        """
      }
    ]
  end
end
