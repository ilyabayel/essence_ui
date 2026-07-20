defmodule Storybook.Primitives.SwitchStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Switch

  def function, do: &Switch.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Radix docs switch demo",
        template: """
        <div class="radix-demo" data-component="switch">
          <form>
            <div style="display: flex; align-items: center;">
              <label
                id="airplane-mode-label"
                for="airplane-mode"
                class="Label"
                style="padding-right: 15px;"
              >
                Airplane mode
              </label>
              <Switch.root
                id="airplane-mode"
                class="SwitchRoot"
                aria-labelledby="airplane-mode-label"
              >
                <Switch.thumb class="SwitchThumb" />
              </Switch.root>
            </div>
          </form>
        </div>
        """
      }
    ]
  end
end
