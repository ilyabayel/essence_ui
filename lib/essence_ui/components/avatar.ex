defmodule EssenceUI.Components.Avatar do
  @moduledoc """
  The Avatar component displays a user profile picture, initials, or fallback icon.

  Based on Radix UI Themes Avatar component. Wraps `EssenceUI.Primitives.Avatar`.
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
  require MarginProps
  require RadiusProps

  @doc """
  Renders an avatar component.

  ## Examples

      <.avatar fallback="JD" />
      <.avatar src="/path/to/image.jpg" fallback="JD" />
      <.avatar size="5" variant="solid" color="indigo" fallback="AB" />
      <.avatar fallback="JD" high_contrast={true} />

  ## Props

    * `src` - The image source URL. If the image fails to load, the fallback will be displayed.
    * `fallback` - Required. The fallback content when no image is provided or image fails to load. Can be initials or an icon.
    * `alt` - The alternative text for the image.
    * `size` - Avatar size from `1` to `9`. Controls the avatar dimensions. Can be a string or a responsive map.
    * `variant` - Visual variant: `"solid"` or `"soft"`. Defaults to `"soft"`.
    * `color` - The accent color.
    * `high_contrast` - Whether to increase color contrast with the background.
    * `radius` - Border radius: one of `"none"`, `"small"`, `"medium"`, `"large"`, or `"full"`.
    * `as_child` - Composes the component into its immediate child instead of rendering its own HTML element.
    * `class` - Additional CSS classes to add to the element.
    * `style` - Additional inline styles.
    * `rest` - Additional HTML attributes to add to the element.
  """

  AsChildProps.attrs()
  RadiusProps.attrs()
  ColorProps.attrs()
  HighContrastProps.attrs()
  MarginProps.attrs()

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

  attr :fallback, :any, doc: "Slot for fallback content for text."
  slot :fallback_slot, doc: "Slot for fallback content, can be initials or an icon."

  def avatar(assigns) do
    prop_defs =
      %{
        size: %{
          type: :enum,
          values: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
          default: "3",
          class: "est-r-size"
        },
        variant: %{
          type: :enum,
          values: ["solid", "soft"],
          default: "soft",
          class: "est-variant"
        }
      }
      |> Map.merge(AsChildProps.prop_defs())
      |> Map.merge(RadiusProps.prop_defs())
      |> Map.merge(MarginProps.prop_defs())
      |> Map.merge(HighContrastProps.prop_defs())

    extracted = EssenceUI.Helpers.ExtractProps.call(assigns, prop_defs)

    class = ["est-reset", "est-AvatarRoot", extracted.class] |> Enum.filter(& &1) |> Enum.join(" ")

    id = assigns[:id] || "avatar-#{System.unique_integer([:positive])}"

    assigns =
      assigns
      |> assign(id: id)
      |> assign(class: class)
      |> assign(color: assigns[:color] || false)
      |> assign(radius: assigns[:radius] || false)
      |> assign(high_contrast: assigns[:high_contrast] || false)
      |> assign(has_image: !is_nil(assigns[:src]) and assigns[:src] != "")
      |> assign(fallback: assigns[:fallback] || nil)
      |> assign(fallback_classes: fallback_classes(assigns[:fallback]))

    ~H"""
    <.root
      id={@id}
      class={@class}
      style={@style}
      data-accent-color={@color}
      data-radius={@radius}
      {@rest}
    >
      <.image :if={@has_image} src={@src} alt={@alt} class="est-AvatarImage" />
      <.fallback :if={@has_image or @fallback || @fallback_slot != []} class={@fallback_classes} delay_ms={0}>
        <%= if @fallback do %>
          {render_fallback(@fallback)}
        <% else %>
          {render_slot(@fallback_slot)}
        <% end %>
      </.fallback>
    </.root>
    """
  end

  defp fallback_classes(fallback) do
    [
      "est-AvatarFallback",
      fallback_size_class(fallback)
    ]
    |> Enum.filter(& &1)
    |> Enum.join(" ")
  end

  defp fallback_size_class(fallback) when is_binary(fallback) do
    case String.length(fallback) do
      1 -> "est-one-letter"
      2 -> "est-two-letters"
      _ -> nil
    end
  end

  defp fallback_size_class(_), do: nil

  defp render_fallback(fallback) when is_binary(fallback), do: String.upcase(fallback)
  defp render_fallback(fallback), do: fallback
end
