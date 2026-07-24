defmodule EssenceUI.Components.Avatar do
  @moduledoc """
  The Avatar component displays a user profile picture, initials, or fallback icon.

  Based on EssenceUI.Primitives.Avatar / Radix UI Themes Avatar.
  """

  use Phoenix.Component

  import EssenceUI.Primitives.Avatar, only: [root: 1, image: 1, fallback: 1]

  alias EssenceUI.SharedProps.AsChildProps
  alias EssenceUI.SharedProps.ColorProps
  alias EssenceUI.SharedProps.HighContrastProps
  alias EssenceUI.SharedProps.MarginProps
  alias EssenceUI.SharedProps.RadiusProps

  require AsChildProps
  require ColorProps
  require HighContrastProps
  require RadiusProps

  @doc """
  Renders an avatar component.

  ## Examples

      <.avatar fallback="JD" />
      <.avatar src="/path/to/image.jpg" fallback="JD" />
      <.avatar size="5" variant="solid" color="indigo" fallback="AB" />
  """

  AsChildProps.attrs()
  RadiusProps.attrs()
  ColorProps.attrs()
  HighContrastProps.attrs()

  attr :id, :string, default: nil

  attr :size, :any,
    default: "3",
    doc:
      ~s(Avatar size from 1 to 9. Controls the avatar dimensions. Can be "1" or %{xs: "1", sm: "2", md: "3", lg: "4", xl: "5"}. Defaults to "3".)

  attr :variant, :string,
    values: ["solid", "soft"],
    doc: "The visual variant: 'solid' or 'soft'. Defaults to 'soft'."

  attr :src, :string, default: nil, doc: "The image source URL."
  attr :alt, :string, default: "", doc: "The alternative text for the image."

  attr :class, :string, default: nil
  attr :style, :string, default: ""
  attr :rest, :global

  attr :fallback, :any, doc: "Fallback content for text."
  slot :fallback_slot, doc: "Slot for fallback content, can be initials or an icon."

  def avatar(assigns) do
    prop_defs =
      %{
        size: %{
          type: :enum,
          values: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
          default: "3",
          class: "rt-r-size"
        },
        variant: %{
          type: :enum,
          values: ["solid", "soft"],
          default: "soft",
          class: "rt-variant"
        }
      }
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(HighContrastProps.prop_defs())

    extracted = EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)

    id =
      assigns[:id] ||
        "avatar-#{5 |> :crypto.strong_rand_bytes() |> Base.encode32(padding: false, case: :lower)}"

    class = ["rt-reset", "rt-AvatarRoot", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    fallback_class =
      [
        "rt-AvatarFallback",
        fallback_size_class(assigns[:fallback])
      ]
      |> Enum.filter(& &1)
      |> Enum.join(" ")

    assigns =
      assigns
      |> assign(id: id)
      |> assign(class: class)
      |> assign(style: extracted.style || assigns[:style])
      |> assign(color: assigns[:color] || false)
      |> assign(radius: assigns[:radius] || false)
      |> assign(has_image: !is_nil(assigns[:src]) and assigns[:src] != "")
      |> assign(fallback: assigns[:fallback] || nil)
      |> assign(fallback_class: fallback_class)

    ~H"""
    <.root
      id={@id}
      class={@class}
      style={@style}
      data-accent-color={@color}
      data-radius={@radius}
      {@rest}
    >
      <.image :if={@has_image} src={@src} alt={@alt} class="rt-AvatarImage" />
      <.fallback class={@fallback_class} delay_ms={0}>
        <%= if @fallback do %>
          {render_fallback(@fallback)}
        <% else %>
          {render_slot(@fallback_slot)}
        <% end %>
      </.fallback>
    </.root>
    """
  end

  defp fallback_size_class(fallback) when is_binary(fallback) do
    case String.length(fallback) do
      1 -> "rt-one-letter"
      2 -> "rt-two-letters"
      _ -> nil
    end
  end

  defp fallback_size_class(_), do: nil

  defp render_fallback(fallback) when is_binary(fallback), do: String.upcase(fallback)
  defp render_fallback(fallback), do: fallback
end
