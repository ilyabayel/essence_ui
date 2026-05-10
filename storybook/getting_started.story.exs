defmodule Storybook.GettingStarted do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  @moduledoc false
  use PhoenixStorybook.Story, :page

  import EssenceUI.Components.Box
  import EssenceUI.Components.Button
  import EssenceUI.Components.Code
  import EssenceUI.Components.Flex
  import EssenceUI.Components.Heading
  import EssenceUI.Components.Text

  alias EssenceUI.Components.Link

  def render(assigns) do
    ~H"""
    <main
      data-accent-color="indigo"
      data-gray-color="slate"
      data-scaling="100%"
      style="display: block; margin-top: -2rem;"
      class="essence-ui"
      data-radius="medium"
    >
      <.text as="p" mb="4">
        EssenceUI is a pre-styled component library for Phoenix LiveView, 100% compatible with <a
          href="https://www.radix-ui.com/themes"
          target="_blank"
        >Radix UI Themes</a>.
        It provides a set of accessible, themeable, and composable UI primitives for Elixir/Phoenix projects.
      </.text>

      <.heading as="h2" size="5" mt="6" mb="2">1. Install EssenceUI</.heading>
      <.text as="p">
        Add
        <.code color="gray" high_contrast>:essence_ui</.code>
        to your
        <.code color="gray" high_contrast>mix.exs</.code>
        dependencies:
      </.text>
      <.code color="indigo" style="display: block; padding: 0.5rem 0.75rem; margin: 0.5rem 0;">
        {~s[{:essence_ui, "~> 0.1.0"}]}
      </.code>
      <.text as="p" mb="4">
        Then run
        <.code color="gray" high_contrast>mix deps.get</.code>
        to fetch the package.
      </.text>

      <.heading as="h2" size="5" mt="6" mb="2">2. Import the CSS files</.heading>
      <.text as="p">
        Import the EssenceUI CSS in your
        <.code color="gray" high_contrast>assets/css/app.css</.code>
        (or equivalent):
      </.text>
      <.code color="indigo" style="display: block; padding: 0.5rem 0.75rem; margin: 0.5rem 0;">
        @import "essence-ui/styles.css";
      </.code>
      <.text as="p" mb="4">
        Make sure your build tool (esbuild, tailwind, etc.) is configured to include the EssenceUI CSS.
      </.text>
      <.heading as="h2" size="5" mt="6" mb="2">3. Set up the Theme Provider</.heading>
      <.text as="p">
        Wrap your root layout or main container with the required data attributes to enable theming:
      </.text>
      <.code color="indigo" style="display: block">
        <pre style="margin: 0; margin-top: 1rem;">
      {"<main"}
      {~s[  data-accent-color="indigo"]}
      {~s[  data-gray-color="slate"]}
      {~s[  data-radius="medium"]}
      {~s[  data-scaling="100%"]}
      {~s[>]}
      {~s[  ...]}
      {~s[</main>]}
        </pre>
      </.code>
      <.text as="p" mb="4">
        You can customize <.code color="gray" high_contrast>data-accent-color</.code>, <.code
          color="gray"
          high_contrast
        >data-gray-color</.code>, <.code color="gray" high_contrast>data-radius</.code>, and
        <.code color="gray" high_contrast>data-scaling</.code>
        to match your brand or preferences.
      </.text>

      <.heading as="h2" size="5" mt="6" mb="2">4. Start building</.heading>
      <.text as="p">
        You are now ready to use EssenceUI components in your LiveView or HEEx templates:
      </.text>
      <.box style="border: 1px solid #eaeaea; padding: 1rem; margin-top: 1rem; margin-bottom: 1rem;">
        <.flex direction="column" gap="2" align="start">
          <.text>Hello from EssenceUI</.text>
          <.button>Let's go</.button>
        </.flex>
      </.box>
      <.code color="indigo" style="display: block">
        <pre style="margin: 0; margin-top: 1rem;">
      {~s[<.flex direction="column" gap="2" align="start">]}
      {~s[  <.text>Hello from EssenceUI</.text>]}
      {~s[  <.button>Let's go</.button>]}
      {~s[</.flex>]}
          </pre>
      </.code>

      <.heading as="h2" size="5" mt="6" mb="2">Customizing your theme</.heading>
      <.text as="p">
        You can further customize your theme by adjusting the data attributes on your root element. See the
        <Link.es_link href="https://www.radix-ui.com/themes/docs/components/theme" target="_blank">
          Theme documentation
        </Link.es_link>
        for all available options.
      </.text>

      <.heading as="h2" size="5" mt="6" mb="2">Take it further</.heading>
      <.text as="p">
        Explore more concepts and features:
      </.text>
      <ul style="margin-bottom: 2rem;">
        <li>
          <Link.es_link href="https://www.radix-ui.com/themes/docs/overview/styling" target="_blank">
            Styling
          </Link.es_link>: Learn how to approach styling and overrides.
        </li>
        <li>
          <Link.es_link href="https://www.radix-ui.com/themes/docs/overview/layout" target="_blank">
            Layout
          </Link.es_link>: Get to know the layout primitives and their properties.
        </li>
        <li>
          <Link.es_link href="https://www.radix-ui.com/themes/docs/theme/overview" target="_blank">
            Theme overview
          </Link.es_link>: Anatomy of a theme and how to create your style.
        </li>
        <li>
          <Link.es_link href="https://www.radix-ui.com/themes/docs/theme/color" target="_blank">
            Color
          </Link.es_link>: Understand the color system and its application.
        </li>
        <li>
          <Link.es_link href="https://www.radix-ui.com/themes/docs/theme/dark-mode" target="_blank">
            Dark mode
          </Link.es_link>: Integrate a great looking dark mode.
        </li>
        <li>
          <Link.es_link href="https://www.radix-ui.com/themes/docs/theme/typography" target="_blank">
            Typography
          </Link.es_link>: Add custom typefaces and fine tune typographic details.
        </li>
      </ul>

      <script>
        console.log("EssenceUI is installed and ready to use!");
        const htmlElement = document.documentElement;
        const isDark = htmlElement.classList.contains("psb-dark");
        const sandboxElement = document.querySelector(".essence-ui")

        const mutationObserver = new MutationObserver((mutations) => {
          mutations.forEach((mutation) => {
            if (mutation.attributeName === "class" && mutation.target !== sandboxElement) {
              const isDark = htmlElement.classList.contains("psb-dark");
              console.log("Dark mode changed:", isDark);
              if (isDark) {
                sandboxElement.classList.add("dark")
              } else {
                sandboxElement.classList.remove("dark")
              }
            }
          });
        });

        mutationObserver.observe(htmlElement, {
          attributes: true,
          attributeFilter: ["class"],
          subtree: true
        });
      </script>
    </main>
    """
  end
end
