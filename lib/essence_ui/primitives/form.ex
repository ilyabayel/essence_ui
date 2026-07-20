defmodule EssenceUI.Primitives.Form do
  @moduledoc false

  use EssenceUI.Primitives

  @validity_matches ~w(
    valueMissing typeMismatch patternMismatch tooLong tooShort
    rangeUnderflow rangeOverflow stepMismatch badInput customError valid
  )

  attr :id, :string, required: true
  attr :rest, :global, include: ~w(action method enctype name novalidate autocomplete target rel)
  slot :inner_block, required: true

  def root(assigns) do
    ~H"""
    <form id={@id} phx-hook="FormRoot" data-essence-form-root novalidate {@rest}>
      {render_slot(@inner_block)}
    </form>
    """
  end

  attr :id, :string, default: nil
  attr :name, :string, required: true
  attr :server_invalid, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def field(assigns) do
    ~H"""
    <div
      id={@id}
      data-essence-form-field
      data-name={@name}
      data-invalid={if @server_invalid, do: ""}
      data-server-invalid={if @server_invalid, do: ""}
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :for, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <label id={@id} for={@for} data-essence-form-label {@rest}>
      {render_slot(@inner_block)}
    </label>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def control(assigns) do
    ~H"""
    <div id={@id} data-essence-form-control {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :match, :string, default: nil
  attr :name, :string, default: nil
  attr :force_match, :boolean, default: false
  attr :rest, :global
  slot :inner_block, required: true

  def message(assigns) do
    ~H"""
    <span
      id={@id}
      data-essence-form-message
      data-match={@match}
      data-name={@name}
      data-force-match={if @force_match, do: ""}
      hidden
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  attr :id, :string, default: nil
  attr :name, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def validity_state(assigns) do
    ~H"""
    <div
      id={@id}
      data-essence-form-validity-state
      data-name={@name}
      data-valid=""
      {@rest}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def submit(assigns) do
    ~H"""
    <button id={@id} type="submit" data-essence-form-submit {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  def validity_matches, do: @validity_matches
end
