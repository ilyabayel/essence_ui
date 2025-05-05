defmodule EssenceUI.Components.Button do
  @moduledoc false

  use Phoenix.Component

  attr :class, :string, default: ""
  attr :variant, :atom, values: [:primary, :secondary, :destructive, :outline, :ghost, :link], default: :primary
  attr :rest, :global, default: %{}
  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2"
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end
end
