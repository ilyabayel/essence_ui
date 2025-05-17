defmodule Storybook.Layout.Root do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Index.html for full index
  # documentation.
  @moduledoc false
  use PhoenixStorybook.Index

  def folder_name, do: "Layout"

  def entry("layout") do
    [
      name: "Layout",
      icon: {:fa, "hand-wave", :thin}
    ]
  end
end
