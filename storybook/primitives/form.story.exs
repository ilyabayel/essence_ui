defmodule Storybook.Primitives.FormStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  alias EssenceUI.Primitives.Form

  def function, do: &Form.root/1

  def container, do: :div
  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :primitive,
        description: "Radix docs form demo",
        template: """
        <div class="radix-demo" data-component="form">
          <Form.root id="form-primitive" class="FormRoot">
            <Form.field class="FormField" name="email">
              <div style="display: flex; align-items: baseline; justify-content: space-between;">
                <Form.label class="FormLabel">Email</Form.label>
                <Form.message class="FormMessage" match="valueMissing">Please enter your email</Form.message>
                <Form.message class="FormMessage" match="typeMismatch">Please provide a valid email</Form.message>
              </div>
              <Form.control>
                <input class="Input" type="email" name="email" required />
              </Form.control>
            </Form.field>
            <Form.field class="FormField" name="question">
              <div style="display: flex; align-items: baseline; justify-content: space-between;">
                <Form.label class="FormLabel">Question</Form.label>
                <Form.message class="FormMessage" match="valueMissing">Please enter a question</Form.message>
              </div>
              <Form.control>
                <textarea class="Textarea" name="question" required></textarea>
              </Form.control>
            </Form.field>
            <Form.submit class="Button" style="margin-top: 10px;">Post question</Form.submit>
          </Form.root>
        </div>
        """
      }
    ]
  end
end
