defmodule EssenceUI.Primitives.OneTimePasswordField do
  @moduledoc false

  use EssenceUI.Primitives

  attr :id, :string, required: true
  attr :value, :string, default: nil
  attr :default_value, :string, default: ""
  attr :length, :integer, default: nil
  attr :max_length, :integer, default: 6
  attr :name, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :read_only, :boolean, default: false
  attr :auto_submit, :boolean, default: false
  attr :auto_focus, :boolean, default: false
  attr :orientation, :string, values: ["horizontal", "vertical"], default: "horizontal"
  attr :type, :string, values: ["text", "password"], default: "text"
  attr :auto_complete, :string, values: ["one-time-code", "off"], default: "one-time-code"
  attr :validation_type, :string, values: ["numeric", "alpha", "alphanumeric", "none"], default: "numeric"
  attr :placeholder, :string, default: nil
  attr :form, :string, default: nil
  attr :on_value_change, :string, default: nil
  attr :on_complete, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: false

  def root(assigns) do
    length = assigns.length || assigns.max_length || 6
    value = assigns.value || assigns.default_value || ""
    chars = value |> to_string() |> String.graphemes() |> Enum.take(length)
    auto_inputs = Enum.empty?(List.wrap(Map.get(assigns, :inner_block)))

    assigns =
      assigns
      |> assign(:length_attr, length)
      |> assign(:value_attr, value)
      |> assign(:chars, chars)
      |> assign(:auto_inputs, auto_inputs)

    ~H"""
    <div
      id={@id}
      phx-hook="OneTimePasswordFieldRoot"
      role="group"
      data-radix-otp-root
      data-length={@length_attr}
      data-value={@value_attr}
      data-name={@name}
      data-disabled={if @disabled, do: ""}
      data-readonly={if @read_only, do: ""}
      data-auto-submit={if @auto_submit, do: "true"}
      data-orientation={@orientation}
      data-type={@type}
      data-auto-complete={@auto_complete}
      data-validation-type={@validation_type}
      data-on-value-change={@on_value_change}
      data-on-complete={@on_complete}
      {@rest}
    >
      <.hidden_input name={@name} value={@value_attr} form={@form} disabled={@disabled} />
      <%= if @auto_inputs do %>
        <%= for index <- 0..(@length_attr - 1) do %>
          <.input
            index={index}
            value={Enum.at(@chars, index)}
            disabled={@disabled}
            read_only={@read_only}
            placeholder={@placeholder}
            autofocus={@auto_focus && index == 0}
            validation_type={@validation_type}
            type={@type}
            code_length={@length_attr}
            autofill={index == 0}
          />
        <% end %>
      <% else %>
        {render_slot(@inner_block)}
      <% end %>
    </div>
    """
  end

  attr :id, :string, default: nil
  attr :index, :integer, required: true
  attr :value, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :read_only, :boolean, default: false
  attr :placeholder, :string, default: nil
  attr :autofocus, :boolean, default: false
  attr :validation_type, :string, default: "numeric"
  attr :type, :string, default: "text"
  attr :code_length, :integer, default: 6
  attr :autofill, :boolean, default: false
  attr :rest, :global

  def input(assigns) do
    input_mode =
      case assigns.validation_type do
        "numeric" -> "numeric"
        _ -> "text"
      end

    pattern =
      case assigns.validation_type do
        "numeric" -> "\\d{1}"
        "alpha" -> "[a-zA-Z]{1}"
        "alphanumeric" -> "[a-zA-Z0-9]{1}"
        _ -> nil
      end

    assigns =
      assigns
      |> assign(:input_mode, input_mode)
      |> assign(:pattern, pattern)

    ~H"""
    <input
      id={@id}
      type={@type}
      inputmode={@input_mode}
      pattern={@pattern}
      maxlength={if @autofill, do: @code_length, else: 1}
      autocomplete={if @autofill, do: "one-time-code", else: "off"}
      data-1p-ignore={if @autofill, do: nil, else: "true"}
      data-lpignore={if @autofill, do: nil, else: "true"}
      data-protonpass-ignore={if @autofill, do: nil, else: "true"}
      data-bwignore={if @autofill, do: nil, else: "true"}
      value={@value}
      disabled={@disabled}
      readonly={@read_only}
      placeholder={@placeholder}
      autofocus={@autofocus}
      data-radix-otp-input
      data-index={@index}
      aria-label={"Character #{@index + 1} of #{@code_length}"}
      {@rest}
    />
    """
  end

  attr :name, :string, default: nil
  attr :value, :string, default: ""
  attr :form, :string, default: nil
  attr :disabled, :boolean, default: false
  attr :rest, :global

  def hidden_input(assigns) do
    ~H"""
    <input
      type="hidden"
      name={@name}
      value={@value}
      form={@form}
      disabled={@disabled}
      data-radix-otp-hidden
      {@rest}
    />
    """
  end
end
