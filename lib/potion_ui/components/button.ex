defmodule PotionUI.Components.Button do
  @moduledoc false

  use Phoenix.Component

  def button(assigns) do
    ~H"""
    <button class="shadow" phx-click={@click}>
      {@label}
    </button>
    """
  end
end
