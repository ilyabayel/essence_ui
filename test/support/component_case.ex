defmodule EssenceUI.ComponentCase do
  @moduledoc """
  Test helpers for rendering Essence UI function components without a Phoenix endpoint.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import EssenceUI.ComponentCase
      import Phoenix.Component
      import Phoenix.LiveViewTest
    end
  end
end
