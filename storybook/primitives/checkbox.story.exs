defmodule Storybook.Primitives.CheckboxStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Checkbox

  def function, do: &Checkbox.root/1

  def variations do
    [
      %Variation{
        id: :primitive,
        template: """
        <form style="display: flex; gap: 1rem;">
          <Checkbox.root class="CheckboxRoot" default_checked id="checkbox-1">
            <Checkbox.indicator class="CheckboxIndicator">
              <svg fill="#000000" width="18px" height="18px" viewBox="-96 -96 2112.00 2112.00" xmlns="http://www.w3.org/2000/svg" stroke="#000000" stroke-width="76.8"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M1827.701 303.065 698.835 1431.801 92.299 825.266 0 917.564 698.835 1616.4 1919.869 395.234z" fill-rule="evenodd"></path> </g></svg>
            </Checkbox.indicator>
          </Checkbox.root>
          <label className="Label" for="checkbox-1">
            Accept terms and conditions.
          </label>
          <style>
            button {
              all: unset;
            }

            .CheckboxRoot {
              background-color: white;
              width: 25px;
              height: 25px;
              border-radius: 4px;
              display: flex;
              align-items: center;
              justify-content: center;
              box-shadow: 0 2px 10px var(--black-a7);
            }
            .CheckboxRoot:hover {
              background-color: var(--violet-3);
            }
            .CheckboxRoot:focus {
              box-shadow: 0 0 0 2px black;
            }

            .CheckboxIndicator {
              display: grid;
              place-content: center;
              color: var(--violet-11);
            }

            .Label {
              color: white;
              padding-left: 15px;
              font-size: 15px;
              line-height: 1;
            }
          </style>
        </form>
        """
      }
    ]
  end
end
