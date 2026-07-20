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
        description: "Headless form primitive with constraint validation",
        template: """
        <Form.root id="form-primitive" class="FormRoot">
          <Form.field name="email" class="FormField">
            <div class="FormFieldHeader">
              <Form.label class="FormLabel">Email</Form.label>
              <Form.message class="FormMessage" match="valueMissing">Please enter your email</Form.message>
              <Form.message class="FormMessage" match="typeMismatch">Please provide a valid email</Form.message>
            </div>
            <Form.control>
              <input class="Input" type="email" name="email" required />
            </Form.control>
          </Form.field>

          <Form.field name="password" class="FormField">
            <div class="FormFieldHeader">
              <Form.label class="FormLabel">Password</Form.label>
              <Form.message class="FormMessage" match="valueMissing">Please enter a password</Form.message>
            </div>
            <Form.control>
              <input class="Input" type="password" name="password" required />
            </Form.control>
          </Form.field>

          <Form.submit class="FormSubmit">Submit</Form.submit>
        </Form.root>

        <style>
          .FormRoot { display: flex; flex-direction: column; gap: 1rem; width: 280px; }
          .FormField { display: flex; flex-direction: column; gap: 0.35rem; }
          .FormFieldHeader { display: flex; justify-content: space-between; align-items: baseline; gap: 0.5rem; }
          .FormLabel { font-size: 14px; font-weight: 500; }
          .FormMessage { font-size: 12px; color: #c0392b; }
          .FormField[data-invalid] .FormLabel { color: #c0392b; }
          .Input { padding: 0.5rem 0.65rem; border: 1px solid #ccc; border-radius: 4px; }
          .FormSubmit { padding: 0.5rem 0.75rem; border: 1px solid #333; background: #333; color: white; border-radius: 4px; cursor: pointer; }
        </style>
        """
      }
    ]
  end
end
