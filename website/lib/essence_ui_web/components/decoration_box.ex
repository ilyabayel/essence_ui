defmodule EssenceUIWeb.DecorationBox do
  @moduledoc false
  use Phoenix.Component

  attr :height, :string, default: "100%", doc: "Height of the decoration box."
  attr :width, :string, default: "100%", doc: "Width of the decoration box."

  def decoration_box(assigns) do
    default_style =
      "background-color: var(--gray-a3); background-clip: padding-box; border: 1px solid var(--gray-a5); border-radius: var(--radius-1); background-image: url('data:image/svg+xml,%3Csvg width=\\'6\\' height=\\'6\\' viewBox=\\'0 0 6 6\\' xmlns=\\'http://www.w3.org/2000/svg\\'%3E%3Cg fill=\\'%239C92AC\\' fill-opacity=\\'0.2\\' fill-rule=\\'evenodd\\'%3E%3Cpath d=\\'M5 0h1L0 6V5zM6 5v1H5z\\'/%3E%3C/g%3E%3C/svg%3E'); background-size: 6px 6px;"

    height = assigns[:height] || "100%"
    width = assigns[:width] || "100%"
    style = default_style <> " height: #{height}; width: #{width};"
    assigns = Map.put(assigns, :style, style)

    ~H"""
    <div style={@style}>
      <div class="rt-Box rt-r-py-9"></div>
    </div>
    """
  end
end
