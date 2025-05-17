defmodule Storybook.Typography.Root do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Index.html for full index
  # documentation.
  @moduledoc false
  use PhoenixStorybook.Index

  def folder_name, do: "Typography"

  def entry("typography") do
    [
      name: "Typography",
      icon: {:fa, "font"}
    ]
  end
end
