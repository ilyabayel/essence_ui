defmodule Storybook.Examples.SelectStory do
  @moduledoc false
  use PhoenixStorybook.Story, :example
  use Phoenix.Component

  import EssenceUI.Components

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  @impl true
  def render(assigns) do
    ~H"""
    <div
      data-scaling="100%"
      data-radius="medium"
      style="display: block;"
      data-gray-color="slate"
      data-accent-color="indigo"
      class="essence-ui"
    >
      <.select_root id="example-select" value={@value} on_change="change">
        <.select_trigger placeholder="Select a fruit" />
        <.select_content>
          <.select_item value="apple">Apple</.select_item>
          <.select_item value="banana">Banana</.select_item>
          <.select_item value="orange">Orange</.select_item>
        </.select_content>
      </.select_root>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, value: "apple")}
  end

  @impl true
  def handle_event("change", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: value)}
  end
end
