defmodule EssenceUI.Primitives.Separator do
  use EssenceUI.Primitives

  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :decorative, :boolean, default: false
  attr :rest, :global
  def separator(assigns) do
    ~H"""
    <div
      role={if @decorative, do: "none", else: "separator"}
      aria-orientation={if @decorative, do: nil, else: @orientation}
      data-orientation={@orientation}
      {@rest}
    />
    """
  end
end
