defmodule Storybook.Themes.Components.Callout do
  @moduledoc """
  Callout component storybook with comprehensive examples.
  """

  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.callout/1

  def imports, do: [{EssenceUI.Components, [callout_icon: 1, callout_text: 1]}, {EssenceUI.Components.Flex, [flex: 1]}]

  def layout, do: :one_column

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default callout with info icon",
        attributes: %{},
        slots: [
          """
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
          </:icon>
          <:text>
            This is a default callout with informational content.
          </:text>
          """
        ]
      },
      %Variation{
        id: :variants,
        description: "Different visual variants",
        attributes: %{},
        template: """
        <.flex gap="4" direction="column">
          <.callout variant="soft">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              Soft variant callout (default)
            </:text>
          </.callout>

          <.callout variant="surface">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              Surface variant with subtle border
            </:text>
          </.callout>

          <.callout variant="outline">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              Outline variant with visible border
            </:text>
          </.callout>
        </.flex>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different sizes",
        attributes: %{},
        template: """
        <.flex gap="4" direction="column">
          <.callout size="1">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              You will need admin privileges to install and access this application
            </:text>
          </.callout>

          <.callout size="2">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              You will need admin privileges to install and access this application
            </:text>
          </.callout>

          <.callout size="3">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              You will need admin privileges to install and access this application
            </:text>
          </.callout>
        </.flex>
        """
      },
      %Variation{
        id: :colors,
        description: "Different accent colors",
        attributes: %{},
        template: """
        <.flex gap="4" direction="column">
          <.callout color="gray">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-badge-icon lucide-badge"><path d="M3.85 8.62a4 4 0 0 1 4.78-4.77 4 4 0 0 1 6.74 0 4 4 0 0 1 4.78 4.78 4 4 0 0 1 0 6.74 4 4 0 0 1-4.77 4.78 4 4 0 0 1-6.75 0 4 4 0 0 1-4.78-4.77 4 4 0 0 1 0-6.76Z"/></svg>
            </:icon>
            <:text>
              Gray color (default)
            </:text>
          </.callout>

          <.callout color="blue">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              Blue informational message
            </:text>
          </.callout>

          <.callout color="green">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-check-icon lucide-check"><path d="M20 6 9 17l-5-5"/></svg>
            </:icon>
            <:text>
              Green success message
            </:text>
          </.callout>

          <.callout color="yellow">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-alert-icon lucide-circle-alert"><circle cx="12" cy="12" r="10"/><line x1="12" x2="12" y1="8" y2="12"/><line x1="12" x2="12.01" y1="16" y2="16"/></svg>
            </:icon>
            <:text>
              Yellow warning message
            </:text>
          </.callout>

          <.callout color="red">
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x"><circle cx="12" cy="12" r="10"/><path d="m15 9-6 6"/><path d="m9 9 6 6"/></svg>
            </:icon>
            <:text>
              Red error message
            </:text>
          </.callout>
        </.flex>
        """
      },
      %Variation{
        id: :high_contrast,
        description: "High contrast variations",
        attributes: %{},
        template: """
        <.flex gap="4" direction="column">
          <.callout color="blue" high_contrast={false}>
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              Normal contrast blue callout
            </:text>
          </.callout>

          <.callout color="blue" high_contrast={true}>
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info-icon lucide-info"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>
            </:icon>
            <:text>
              High contrast blue callout
            </:text>
          </.callout>

          <.callout color="red" high_contrast={false}>
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x"><circle cx="12" cy="12" r="10"/><path d="m15 9-6 6"/><path d="m9 9 6 6"/></svg>
            </:icon>
            <:text>
              Normal contrast red callout
            </:text>
          </.callout>

          <.callout color="red" high_contrast={true}>
            <:icon>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-x-icon lucide-circle-x"><circle cx="12" cy="12" r="10"/><path d="m15 9-6 6"/><path d="m9 9 6 6"/></svg>
            </:icon>
            <:text>
              High contrast red callout
            </:text>
          </.callout>
        </.flex>
        """
      },
      %Variation{
        id: :without_icon,
        description: "Callout without icon",
        attributes: %{},
        template: """
        <.callout>
          <:text>
            This callout doesn't have an icon, just text content.
          </:text>
        </.callout>
        """
      },
      %Variation{
        id: :complex_content,
        description: "Callout with complex content",
        attributes: %{},
        template: """
        <.callout size="3" color="yellow" variant="surface">
          <:icon>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-alert-icon lucide-circle-alert"><circle cx="12" cy="12" r="10"/><line x1="12" x2="12" y1="8" y2="12"/><line x1="12" x2="12.01" y1="16" y2="16"/></svg>
          </:icon>
          <:text>
            <strong>Important Notice:</strong> Your trial period will expire in 3 days.
            Please upgrade your plan to continue using all features.
            <a href="#" class="underline">View pricing options</a>.
          </:text>
        </.callout>
        """
      },
      %Variation{
        id: :margin_examples,
        description: "Callouts with different margins",
        attributes: %{},
        template: """
        <div>
          <p>Some content before</p>

          <.callout mt="4" mb="4">
            <:icon>
              <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </:icon>
            <:text>
              Callout with top and bottom margins
            </:text>
          </.callout>

          <.callout mx="8" my="2">
            <:icon>
              <svg class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </:icon>
            <:text>
              Callout with horizontal and vertical margins
            </:text>
          </.callout>

          <p>Some content after</p>
        </div>
        """
      }
    ]
  end
end
