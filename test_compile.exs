try do
  Code.compile_file("storybook/examples/recruiting_crm.story.exs")
rescue
  e -> 
    IO.puts("ERROR: #{inspect(e)}")
    IO.puts(Exception.format(:error, e, __STACKTRACE__))
end
