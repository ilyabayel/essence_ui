defmodule Storybook.Themes.Components.Checkbox do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Checkbox.checkbox/1

  def imports, do: [{EssenceUI.Components.Flex, flex: 1}, {EssenceUI.Components.Text, text: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block; padding: 20px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{},
        template: """
        <.checkbox default_checked/>
        """
      },
      %Variation{
        id: :checked,
        description: "Checked checkbox",
        attributes: %{},
        template: """
        <.checkbox checked />
        """
      },
      %Variation{
        id: :indeterminate,
        description: "Indeterminate checkbox state",
        attributes: %{},
        template: """
        <.checkbox checked="indeterminate" />
        """
      },
      %Variation{
        id: :sizes,
        description: "Different checkbox sizes (1-3)",
        attributes: %{},
        template: """
        <.flex gap="4" align="center">
          <.checkbox size="1" />
          <.checkbox size="1" checked />
          <.checkbox size="2" />
          <.checkbox size="2" checked />
          <.checkbox size="3" />
          <.checkbox size="3" checked />
        </.flex>
        """
      },
      %Variation{
        id: :variants,
        description: "Different checkbox variants",
        attributes: %{},
        template: """
        <.flex gap="4" direction="column">
          <.flex gap="2" align="center">
            <.text size="2" weight="medium">Surface:</.text>
            <.checkbox variant="surface" />
            <.checkbox variant="surface" checked />
            <.checkbox variant="surface" checked="indeterminate" />
          </.flex>
          <.flex gap="2" align="center">
            <.text size="2" weight="medium">Classic:</.text>
            <.checkbox variant="classic" />
            <.checkbox variant="classic" checked />
            <.checkbox variant="classic" checked="indeterminate" />
          </.flex>
          <.flex gap="2" align="center">
            <.text size="2" weight="medium">Soft:</.text>
            <.checkbox variant="soft" />
            <.checkbox variant="soft" checked />
            <.checkbox variant="soft" checked="indeterminate" />
          </.flex>
        </.flex>
        """
      },
      %Variation{
        id: :colors,
        description: "Different checkbox colors",
        attributes: %{},
        template: """
        <.flex gap="3" wrap="wrap">
          <.checkbox color="blue" checked />
          <.checkbox color="green" checked />
          <.checkbox color="red" checked />
          <.checkbox color="orange" checked />
          <.checkbox color="purple" checked />
          <.checkbox color="pink" checked />
          <.checkbox color="cyan" checked />
          <.checkbox color="yellow" checked />
          <.checkbox color="indigo" checked />
          <.checkbox color="gray" checked />
        </.flex>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast checkboxes",
        attributes: %{},
        template: """
        <.flex gap="4" direction="column">
          <.flex gap="2" align="center">
            <.text size="2">Normal:</.text>
            <.checkbox color="blue" checked />
            <.checkbox color="green" checked />
            <.checkbox color="red" checked />
          </.flex>
          <.flex gap="2" align="center">
            <.text size="2">High Contrast:</.text>
            <.checkbox color="blue" high_contrast checked />
            <.checkbox color="green" high_contrast checked />
            <.checkbox color="red" high_contrast checked />
          </.flex>
        </.flex>
        """
      },
      %Variation{
        id: :disabled,
        description: "Disabled checkboxes",
        attributes: %{},
        template: """
        <.flex gap="2" align="center">
          <.checkbox disabled />
          <.checkbox disabled checked />
          <.checkbox disabled checked="indeterminate" />
        </.flex>
        """
      },
      %Variation{
        id: :with_labels,
        description: "Checkboxes with labels (accessibility example)",
        attributes: %{},
        template: """
        <.flex gap="3" direction="column">
          <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
            <.checkbox name="newsletter" value="subscribe" />
            <.text size="2">Subscribe to newsletter</.text>
          </label>
          <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
            <.checkbox name="notifications" value="enable" checked />
            <.text size="2">Enable notifications</.text>
          </label>
          <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
            <.checkbox name="terms" value="agree" checked="indeterminate" />
            <.text size="2">Agree to terms and conditions</.text>
          </label>
          <label style="display: flex; align-items: center; gap: 8px; cursor: pointer; opacity: 0.6;">
            <.checkbox name="premium" value="upgrade" disabled />
            <.text size="2" color="gray">Upgrade to premium (disabled)</.text>
          </label>
        </.flex>
        """
      },
      %Variation{
        id: :form_example,
        description: "Form usage example",
        attributes: %{},
        template: """
        <form style="max-width: 300px;">
          <.text size="3" weight="bold" mb="3">User Preferences</.text>
          <.flex gap="3" direction="column">
            <label style="display: flex; align-items: center; gap: 8px;">
              <.checkbox name="email_marketing" value="true" />
              <.text size="2">Email marketing</.text>
            </label>
            <label style="display: flex; align-items: center; gap: 8px;">
              <.checkbox name="product_updates" value="true" checked />
              <.text size="2">Product updates</.text>
            </label>
            <label style="display: flex; align-items: center; gap: 8px;">
              <.checkbox name="security_alerts" value="true" checked />
              <.text size="2">Security alerts</.text>
            </label>
            <label style="display: flex; align-items: center; gap: 8px;">
              <.checkbox name="beta_features" value="true" checked="indeterminate" />
              <.text size="2">Beta features (some enabled)</.text>
            </label>
          </.flex>
        </form>
        """
      },
      %Variation{
        id: :margin_props,
        description: "Checkbox margin props demonstration",
        attributes: %{},
        template: """
        <.flex gap="2" direction="column">
          <div style="border: 1px dashed var(--gray-6); padding: 8px;">
            <.checkbox m="2" />
            <.text size="1" color="gray">Margin all sides</.text>
          </div>
          <div style="border: 1px dashed var(--gray-6); padding: 8px;">
            <.checkbox mx="4" />
            <.text size="1" color="gray">Margin horizontal</.text>
          </div>
          <div style="border: 1px dashed var(--gray-6); padding: 8px;">
            <.checkbox my="3" />
            <.text size="1" color="gray">Margin vertical</.text>
          </div>
        </.flex>
        """
      },
      %Variation{
        id: :size_color_combinations,
        description: "Size and color combinations",
        attributes: %{},
        template: """
        <.flex gap="4" direction="column">
          <.flex gap="2" align="center">
            <.text size="1">Size 1:</.text>
            <.checkbox size="1" color="blue" checked />
            <.checkbox size="1" color="green" checked />
            <.checkbox size="1" color="red" checked />
          </.flex>
          <.flex gap="2" align="center">
            <.text size="2">Size 2:</.text>
            <.checkbox size="2" color="blue" checked />
            <.checkbox size="2" color="green" checked />
            <.checkbox size="2" color="red" checked />
          </.flex>
          <.flex gap="2" align="center">
            <.text size="3">Size 3:</.text>
            <.checkbox size="3" color="blue" checked />
            <.checkbox size="3" color="green" checked />
            <.checkbox size="3" color="red" checked />
          </.flex>
        </.flex>
        """
      },
      %Variation{
        id: :states_showcase,
        description: "All checkbox states showcase",
        attributes: %{},
        template: """
        <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; align-items: center;">
          <.text size="2" weight="bold">State</.text>
          <.text size="2" weight="bold">Surface</.text>
          <.text size="2" weight="bold">Classic</.text>
          <.text size="2" weight="bold">Soft</.text>

          <.text size="1" color="gray">Unchecked</.text>
          <.checkbox variant="surface" />
          <.checkbox variant="classic" />
          <.checkbox variant="soft" />

          <.text size="1" color="gray">Checked</.text>
          <.checkbox variant="surface" checked />
          <.checkbox variant="classic" checked />
          <.checkbox variant="soft" checked />

          <.text size="1" color="gray">Indeterminate</.text>
          <.checkbox variant="surface" checked="indeterminate" />
          <.checkbox variant="classic" checked="indeterminate" />
          <.checkbox variant="soft" checked="indeterminate" />

          <.text size="1" color="gray">Disabled</.text>
          <.checkbox variant="surface" disabled />
          <.checkbox variant="classic" disabled />
          <.checkbox variant="soft" disabled />

          <.text size="1" color="gray">Disabled Checked</.text>
          <.checkbox variant="surface" disabled checked />
          <.checkbox variant="classic" disabled checked />
          <.checkbox variant="soft" disabled checked />
        </div>
        """
      }
    ]
  end
end
