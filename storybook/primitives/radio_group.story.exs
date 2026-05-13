defmodule Storybook.Primitives.RadioGroupStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.RadioGroup

  def function, do: &RadioGroup.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Headless radio group primitive",
        template: """
        <div class="RadioGroupWrapper">
          <RadioGroup.root id="radio-group-primitive" value="1" class="RadioGroupRoot">
            <div class="RadioGroupItemWrapper">
              <RadioGroup.item id="radio-1" value="1" class="RadioGroupItem">
                <RadioGroup.indicator class="RadioGroupIndicator">
                  <div class="RadioGroupIndicatorInner" />
                </RadioGroup.indicator>
              </RadioGroup.item>
              <label class="Label" for="radio-1">Default</label>
            </div>
            <div class="RadioGroupItemWrapper">
              <RadioGroup.item id="radio-2" value="2" class="RadioGroupItem">
                <RadioGroup.indicator class="RadioGroupIndicator">
                  <div class="RadioGroupIndicatorInner" />
                </RadioGroup.indicator>
              </RadioGroup.item>
              <label class="Label" for="radio-2">Comfortable</label>
            </div>
            <div class="RadioGroupItemWrapper">
              <RadioGroup.item id="radio-3" value="3" class="RadioGroupItem">
                <RadioGroup.indicator class="RadioGroupIndicator">
                  <div class="RadioGroupIndicatorInner" />
                </RadioGroup.indicator>
              </RadioGroup.item>
              <label class="Label" for="radio-3">Compact</label>
            </div>
          </RadioGroup.root>

          <style>
            .RadioGroupRoot {
              display: flex;
              flex-direction: column;
              gap: 10px;
            }

            .RadioGroupItemWrapper {
              display: flex;
              align-items: center;
            }

            .RadioGroupItem {
              all: unset;
              background-color: white;
              width: 25px;
              height: 25px;
              border-radius: 100%;
              box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            }
            .RadioGroupItem:hover {
              background-color: #f5f5f5;
            }
            .RadioGroupItem:focus {
              box-shadow: 0 0 0 2px black;
            }

            .RadioGroupIndicator {
              display: flex;
              align-items: center;
              justify-content: center;
              width: 100%;
              height: 100%;
              position: relative;
            }
            .RadioGroupIndicatorInner {
              width: 11px;
              height: 11px;
              border-radius: 50%;
              background-color: #585ad4;
            }

            .Label {
              color: black;
              font-size: 15px;
              line-height: 1;
              padding-left: 15px;
            }
          </style>
        </div>
        """
      },
      %Variation{
        id: :horizontal,
        description: "Radio group with horizontal orientation",
        template: """
        <div class="RadioGroupWrapper">
          <RadioGroup.root id="radio-group-horizontal" orientation="horizontal" value="1" class="RadioGroupRootHorizontal">
            <div class="RadioGroupItemWrapper">
              <RadioGroup.item id="h-radio-1" value="1" class="RadioGroupItem">
                <RadioGroup.indicator class="RadioGroupIndicator">
                  <div class="RadioGroupIndicatorInner" />
                </RadioGroup.indicator>
              </RadioGroup.item>
              <label class="Label" for="h-radio-1">One</label>
            </div>
            <div class="RadioGroupItemWrapper">
              <RadioGroup.item id="h-radio-2" value="2" class="RadioGroupItem">
                <RadioGroup.indicator class="RadioGroupIndicator">
                  <div class="RadioGroupIndicatorInner" />
                </RadioGroup.indicator>
              </RadioGroup.item>
              <label class="Label" for="h-radio-2">Two</label>
            </div>
          </RadioGroup.root>

          <style>
            .RadioGroupRootHorizontal {
              display: flex;
              flex-direction: row;
              gap: 20px;
            }
            /* Re-using styles from first variation */
          </style>
        </div>
        """
      },
      %Variation{
        id: :disabled,
        description: "Radio group with disabled items",
        template: """
        <div class="RadioGroupWrapper">
          <RadioGroup.root id="radio-group-disabled" value="1" class="RadioGroupRoot">
            <div class="RadioGroupItemWrapper">
              <RadioGroup.item id="d-radio-1" value="1" class="RadioGroupItem">
                <RadioGroup.indicator class="RadioGroupIndicator">
                  <div class="RadioGroupIndicatorInner" />
                </RadioGroup.indicator>
              </RadioGroup.item>
              <label class="Label" for="d-radio-1">Enabled</label>
            </div>
            <div class="RadioGroupItemWrapper">
              <RadioGroup.item id="d-radio-2" value="2" disabled class="RadioGroupItem">
                <RadioGroup.indicator class="RadioGroupIndicator">
                  <div class="RadioGroupIndicatorInner" />
                </RadioGroup.indicator>
              </RadioGroup.item>
              <label class="Label" for="d-radio-2" style="opacity: 0.5;">Disabled</label>
            </div>
          </RadioGroup.root>
        </div>
        """
      }
    ]
  end
end
