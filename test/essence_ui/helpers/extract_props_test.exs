defmodule EssenceUI.Helpers.ExtractPropsTest do
  use ExUnit.Case, async: true

  alias EssenceUI.Helpers.ExtractProps

  @values [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "-1",
    "-2",
    "-3",
    "-4",
    "-5",
    "-6",
    "-7",
    "-8",
    "-9"
  ]

  describe "call/2" do
    test "should build class for truthy boolean prop" do
      assigns = %{
        visible: true
      }

      prop_defs = %{
        visible: %{type: :boolean, class: "rt-r-visible"}
      }

      %{class: class} = ExtractProps.call(assigns, prop_defs)

      assert class == "rt-r-visible"
    end

    test "should build class for falsy boolean prop" do
      assigns = %{
        visible: false
      }

      prop_defs = %{
        visible: %{type: :boolean, class: "rt-r-visible"}
      }

      %{class: class} = ExtractProps.call(assigns, prop_defs)

      assert class == ""
    end

    test "should build class with custom properties" do
      assigns = %{
        width: "100px"
      }

      prop_defs = %{
        width: %{type: :string, class: "rt-r-width", custom_properties: ["--width"]}
      }

      extracted_props = ExtractProps.call(assigns, prop_defs)

      assert extracted_props == %{
               class: "rt-r-width",
               style: "--width: 100px"
             }
    end

    test "should build empty class if attr not passed" do
      assigns = %{}

      prop_defs = %{
        visible: %{type: :string, class: "rt-r-width", custom_properties: ["--width"]}
      }

      extracted_props = ExtractProps.call(assigns, prop_defs)

      assert extracted_props == %{
               class: "",
               style: ""
             }
    end

    test "should build class for enum prop" do
      assigns = %{
        gap: "1"
      }

      prop_defs = %{
        gap: %{
          type: :enum,
          values: @values,
          responsive: true,
          class: "rt-r-gap",
          custom_properties: ["--gap"]
        }
      }

      extracted_props = ExtractProps.call(assigns, prop_defs)

      assert extracted_props == %{
               class: "rt-r-gap-1",
               style: ""
             }
    end

    test "should build empty class for enum prop" do
      assigns = %{}

      prop_defs = %{
        gap: %{
          type: :enum,
          values: @values,
          responsive: true,
          class: "rt-r-gap",
          custom_properties: ["--gap"]
        }
      }

      extracted_props = ExtractProps.call(assigns, prop_defs)

      assert extracted_props == %{
               class: "",
               style: ""
             }
    end

    test "should build class for enum, string prop" do
      assigns = %{
        gap: "1"
      }

      prop_defs = %{
        gap: %{
          type: [:enum, :string],
          values: @values,
          responsive: true,
          class: "rt-r-gap",
          custom_properties: ["--gap"]
        }
      }

      extracted_props = ExtractProps.call(assigns, prop_defs)

      assert extracted_props == %{
               class: "rt-r-gap-1",
               style: ""
             }
    end

    test "should build class for enum, string prop with string attr passed" do
      assigns = %{
        gap: "1px"
      }

      prop_defs = %{
        gap: %{
          type: [:enum, :string],
          values: @values,
          responsive: true,
          class: "rt-r-gap",
          custom_properties: ["--gap"]
        }
      }

      extracted_props = ExtractProps.call(assigns, prop_defs)

      assert extracted_props == %{
               class: "rt-r-gap",
               style: "--gap: 1px"
             }
    end

    test "should extract props for responsive breakpoints" do
      assigns = %{
        gap: %{
          initial: "1",
          xs: "2",
          sm: "3",
          md: "4",
          lg: "5",
          xl: "6"
        }
      }

      prop_defs = %{
        gap: %{
          type: [:enum, :string],
          values: @values,
          responsive: true,
          class: "rt-r-gap",
          custom_properties: ["--gap"]
        }
      }

      extracted_props = ExtractProps.call(assigns, prop_defs)

      assert extracted_props == %{
               class: "rt-r-gap-1 xs:rt-r-gap-2 sm:rt-r-gap-3 md:rt-r-gap-4 lg:rt-r-gap-5 xl:rt-r-gap-6",
               style: ""
             }
    end

    test "should extract props for responsive breakpoints with static props" do
      assigns = %{
        gap: %{
          initial: "1px",
          xs: "2px",
          sm: "3px",
          md: "4px",
          lg: "5px",
          xl: "6px"
        }
      }

      prop_defs = %{
        gap: %{
          type: [:enum, :string],
          values: @values,
          responsive: true,
          class: "rt-r-gap",
          custom_properties: ["--gap"]
        }
      }

      extracted_props = ExtractProps.call(assigns, prop_defs)

      assert extracted_props == %{
               class: "rt-r-gap xs:rt-r-gap sm:rt-r-gap md:rt-r-gap lg:rt-r-gap xl:rt-r-gap",
               style: "--gap: 1px; --gap-xs: 2px; --gap-sm: 3px; --gap-md: 4px; --gap-lg: 5px; --gap-xl: 6px"
             }
    end
  end
end
