defmodule Storybook.Themes.Components.Card do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Card.card/1

  def imports,
    do: [
      {EssenceUI.Components.Flex, flex: 1},
      {EssenceUI.Components.Text, text: 1},
      {EssenceUI.Components.Heading, heading: 1},
      {EssenceUI.Components.Avatar, avatar: 1},
      {EssenceUI.Components.Box, box: 1}
    ]

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
        <.box max_width="240px">
        	<.card>
        		<.flex gap="3" align="center">
        			<.avatar
        				size="3"
        				src="https://images.unsplash.com/photo-1607346256330-dee7af15f7c5?&w=64&h=64&dpr=2&q=70&crop=focalpoint&fp-x=0.67&fp-y=0.5&fp-z=1.4&fit=crop"
        				radius="full"
        				fallback="T"
        			/>
        			<.box>
        				<.text as="div" size="2" weight="bold">
        					Teodros Girmay
        				</.text>
        				<.text as="div" size="2" color="gray">
        					Engineering
        				</.text>
        			</.box>
        		</.flex>
        	</.card>
        </.box>
        """
      },
      %Variation{
        id: :sizes,
        description: "Different card sizes",
        attributes: %{},
        template: """
        <.flex gap="3" direction="column">
          <.box width="350px">
            <.card size="1">
              <.flex gap="3" align="center">
                <.avatar size="3" radius="full" fallback="T" color="indigo" />
                <.box>
                  <.text as="div" size="2" weight="bold">
                    Teodros Girmay
                  </.text>
                  <.text as="div" size="2" color="gray">
                    Engineering
                  </.text>
                </.box>
              </.flex>
            </.card>
          </.box>

          <.box width="400px">
            <.card size="2">
              <.flex gap="4" align="center">
                <.avatar size="4" radius="full" fallback="T" color="indigo" />
                <.box>
                  <.text as="div" weight="bold">
                    Teodros Girmay
                  </.text>
                  <.text as="div" color="gray">
                    Engineering
                  </.text>
                </.box>
              </.flex>
            </.card>
          </.box>

          <.box width="500px">
            <.card size="3">
              <.flex gap="4" align="center">
                <.avatar size="5" radius="full" fallback="T" color="indigo" />
                <.box>
                  <.text as="div" size="4" weight="bold">
                    Teodros Girmay
                  </.text>
                  <.text as="div" size="4" color="gray">
                    Engineering
                  </.text>
                </.box>
              </.flex>
            </.card>
          </.box>
        </.flex>
        """
      },
      %Variation{
        id: :variants,
        description: "Different card variants",
        attributes: %{},
        template: """
        <.flex direction="column" gap="3" maxWidth="350px">
          <.card variant="surface">
            <.text as="div" size="2" weight="bold">
              Quick start
            </.text>
            <.text as="div" color="gray" size="2">
              Start building your next project in minutes
            </.text>
          </.card>

          <.card variant="classic">
            <.text as="div" size="2" weight="bold">
              Quick start
            </.text>
            <.text as="div" color="gray" size="2">
              Start building your next project in minutes
            </.text>
          </.card>
        </.flex>
        """
      },
      # TODO: Uncomment when inset component is implemented
      # %Variation{
      #   id: :with_inset_content,
      #   description: "With inset content",
      #   attributes: %{},
      #   template: """
      #   <.box max_width="240px">
      #     <.card size="2">
      #       <.inset clip="padding-box" side="top" pb="current">
      #         <img
      #           src="https://images.unsplash.com/photo-1617050318658-a9a3175e34cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80"
      #           alt="Bold typography"
      #           style="display: block; object-fit: cover; width: 100%; height: 140px; background-color: var(--gray-5);"
      #         />
      #       </.inset>
      #       <.text as="p" size="3">
      #         <strong>Typography</strong> is the art and technique of arranging type to
      #         make written language legible, readable and appealing when displayed.
      #       </.text>
      #     </.card>
      #   </.box>
      #   """
      # },
      %Variation{
        id: :grid_layout,
        description: "Cards in a grid layout",
        attributes: %{},
        template: """
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 16px;">
          <.card size="1">
            <.flex gap="3" align="center">
              <.avatar size="3" radius="full" fallback="T" color="indigo" />
              <.box>
                <.text as="div" size="2" weight="bold">
                  Teodros Girmay
                </.text>
                <.text as="div" size="2" color="gray">
                  Engineering
                </.text>
              </.box>
            </.flex>
          </.card>
          <.card size="1">
            <.flex gap="3" align="center">
              <.avatar size="3" radius="full" fallback="T" color="indigo" />
              <.box>
                <.text as="div" size="2" weight="bold">
                  Teodros Girmay
                </.text>
                <.text as="div" size="2" color="gray">
                  Engineering
                </.text>
              </.box>
            </.flex>
          </.card>
          <.card size="1">
            <.flex gap="3" align="center">
              <.avatar size="3" radius="full" fallback="T" color="indigo" />
              <.box>
                <.text as="div" size="2" weight="bold">
                  Teodros Girmay
                </.text>
                <.text as="div" size="2" color="gray">
                  Engineering
                </.text>
              </.box>
            </.flex>
          </.card>
          <.card size="1">
            <.flex gap="3" align="center">
              <.avatar size="3" radius="full" fallback="T" color="indigo" />
              <.box>
                <.text as="div" size="2" weight="bold">
                  Teodros Girmay
                </.text>
                <.text as="div" size="2" color="gray">
                  Engineering
                </.text>
              </.box>
            </.flex>
          </.card>
        </div>
        """
      }
    ]
  end
end
