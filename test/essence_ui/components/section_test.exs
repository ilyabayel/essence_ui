defmodule EssenceUI.Components.SectionTest do
  use EssenceUI.ComponentCase, async: true

  alias EssenceUI.Components.Section

  test "size sets the section padding class" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Section.section size="2">Section body</Section.section>
          """
        end,
        %{}
      )

    assert html =~ "<section"
    refute html =~ "<div"
    assert html =~ "rt-Section"
    assert html =~ "rt-r-size-2"
    assert html =~ "Section body"
  end

  test "omits a size class when size is not set" do
    html =
      render_component(
        fn assigns ->
          ~H"""
          <Section.section>Plain</Section.section>
          """
        end,
        %{}
      )

    assert html =~ "<section"
    assert html =~ "rt-Section"
    refute html =~ "rt-r-size-"
  end
end
