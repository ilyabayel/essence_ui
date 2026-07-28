defmodule EssenceUIWeb.Components.SiteFooter do
  @moduledoc false
  use EssenceUIWeb, :html

  import EssenceUI.Components

  def site_footer(assigns) do
    ~H"""
    <.box as="footer" class="site-footer" px="4" py="8">
      <.flex
        direction="column"
        justify="space-between"
        gap="6"
        class="site-footer__inner"
      >
        <.flex direction="column" gap="2">
          <.text size="3" weight="bold" high_contrast>Essence UI</.text>
          <.text size="2" color="gray">
            Essence UI for Phoenix LiveView, inspired by Radix Themes.
          </.text>
        </.flex>

        <.flex gap="8" wrap="wrap">
          <.flex direction="column" gap="2">
            <.text size="1" weight="bold" color="gray">Products</.text>
            <.es_link navigate="/" underline="hover" color="gray">
              <.text size="2" color="gray">Themes</.text>
            </.es_link>
            <.es_link navigate="/primitives" underline="hover" color="gray">
              <.text size="2" color="gray">Primitives</.text>
            </.es_link>
            <.es_link navigate="/colors" underline="hover" color="gray">
              <.text size="2" color="gray">Colors</.text>
            </.es_link>
          </.flex>

          <.flex direction="column" gap="2">
            <.text size="1" weight="bold" color="gray">Docs</.text>
            <.es_link navigate="/themes/docs" underline="hover" color="gray">
              <.text size="2" color="gray">Themes docs</.text>
            </.es_link>
            <.es_link navigate="/primitives/docs" underline="hover" color="gray">
              <.text size="2" color="gray">Primitives docs</.text>
            </.es_link>
            <.es_link navigate="/themes/playground" underline="hover" color="gray">
              <.text size="2" color="gray">Playground</.text>
            </.es_link>
          </.flex>

          <.flex direction="column" gap="2">
            <.text size="1" weight="bold" color="gray">Community</.text>
            <.es_link href="https://github.com/ilyabayel/essence_ui" underline="hover" color="gray">
              <.text size="2" color="gray">GitHub</.text>
            </.es_link>
          </.flex>
        </.flex>
      </.flex>
    </.box>
    """
  end
end
