defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  @moduledoc false
  use PhoenixStorybook.Story, :page

  def render(assigns) do
    ~H"""
    """
  end

  def container, do: {:div, "data-gray-color": "slate"}
end
