---
title: Form
description: Collect information from your users using validation rules.
---

Collect information from your users using validation rules.

<.demo variant="primitive" component="form" css={primitive_css("form")}>

  <:heex>
    <Form.root
              id="form-primitive"
              class="FormRoot"
            >
              <Form.field
                class="FormField"
                name="email"
              >
                <div style="display: flex; align-items: baseline; justify-content: space-between;">
                  <Form.label class="FormLabel">Email</Form.label>
                  <Form.message
                    class="FormMessage"
                    match="valueMissing"
                  >
                    Please enter your email
                  </Form.message>
                  <Form.message
                    class="FormMessage"
                    match="typeMismatch"
                  >
                    Please provide a valid email
                  </Form.message>
                </div>
                <Form.control>
                  <input
                    class="Input"
                    type="email"
                    name="email"
                    required
                  />
                </Form.control>
              </Form.field>
              <Form.field
                class="FormField"
                name="question"
              >
                <div style="display: flex; align-items: baseline; justify-content: space-between;">
                  <Form.label class="FormLabel">Question</Form.label>
                  <Form.message
                    class="FormMessage"
                    match="valueMissing"
                  >
                    Please enter a question
                  </Form.message>
                </div>
                <Form.control>
                  <textarea
                    class="Textarea"
                    name="question"
                    required
                  >
                  </textarea>
                </Form.control>
              </Form.field>
              <Form.submit
                class="Button"
                style="margin-top: 10px;"
              >
                Post question
              </Form.submit>
            </Form.root>
  </:heex>
</.demo>

<.highlights>
  <:item> </:item>
  <:item>https://developer.mozilla.org/en-US/docs/Web/HTML/Constraint_validation</:item>
  <:item>Supports built-in validation.</:item>
  <:item>Supports custom validation.</:item>
  <:item>Full customization of validation messages.</:item>
  <:item>Accessible validation messages.</:item>
</.highlights>

## Anatomy

```heex
<Form.root>
  <Form.field />
  <Form.label />
  <Form.control />
  <Form.message />
  <Form.submit />
  <Form.validity_state />
</Form.root>
```

<.anatomy>
  <:part name="Root">The `root` part.</:part>
  <:part name="Field">The `field` part.</:part>
  <:part name="Label">The `label` part.</:part>
  <:part name="Control">The `control` part.</:part>
  <:part name="Message">The `message` part.</:part>
  <:part name="Submit">The `submit` part.</:part>
  <:part name="Validity State">The `validity_state` part.</:part>
</.anatomy>

## API Reference

### Root

<.props_table module={EssenceUI.Primitives.Form} function={:root} />

### Field

<.props_table module={EssenceUI.Primitives.Form} function={:field} />

### Label

<.props_table module={EssenceUI.Primitives.Form} function={:label} />

### Control

<.props_table module={EssenceUI.Primitives.Form} function={:control} />

### Message

<.props_table module={EssenceUI.Primitives.Form} function={:message} />

### Submit

<.props_table module={EssenceUI.Primitives.Form} function={:submit} />

### Validity State

<.props_table module={EssenceUI.Primitives.Form} function={:validity_state} />

## Examples

See the live demo above and `storybook/primitives/form.story.exs` for complete markup. Style with classes and `data-state` as described in the [styling](/primitives/docs/guides/styling) guide.
