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

  attr :open, :boolean, default: false
  attr :value, :string, default: nil

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
      <.select
        placeholder="Select a fruit"
        on_toggle="toggle_open"
        on_change="toggle_change"
        value={@value}
        open={@open}
      >
        <:option value="apple">Apple</:option>
        <:option value="banana">Banana</:option>
        <:option value="orange">Orange</:option>
      </.select>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, open: false, value: nil)}
  end

  @impl true
  def handle_event("toggle_open", _value, socket) do
    {:noreply, assign(socket, :open, !socket.assigns.open)}
  end

  @impl true
  def handle_event("toggle_change", %{"value" => value}, socket) do
    {:noreply, assign(socket, open: false, value: value)}
  end
end
