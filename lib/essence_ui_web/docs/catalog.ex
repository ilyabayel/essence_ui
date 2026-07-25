defmodule EssenceUIWeb.Docs.Catalog do
  @moduledoc false

  alias EssenceUIWeb.Docs.Page

  @content_root Path.expand("../../../docs/content", __DIR__)
  @nav_path Path.expand("../../../docs/nav.exs", __DIR__)

  @external_resource @nav_path

  for path <- Path.wildcard(Path.join(@content_root, "**/*.md")) do
    @external_resource path
  end

  @pages (
           content_root = Path.expand("../../../docs/content", __DIR__)

           content_root
           |> Path.join("**/*.md")
           |> Path.wildcard()
           |> Map.new(fn file ->
             rel =
               file
               |> Path.relative_to(content_root)
               |> String.replace_suffix(".md", "")

             raw = File.read!(file)

             {meta, body} =
               case raw do
                 <<"---\n", rest::binary>> ->
                   case String.split(rest, "\n---\n", parts: 2) do
                     [front, body] ->
                       meta =
                         front
                         |> String.split("\n", trim: true)
                         |> Enum.reduce(%{}, fn line, acc ->
                           case String.split(line, ":", parts: 2) do
                             [key, value] -> Map.put(acc, String.trim(key), String.trim(value))
                             _ -> acc
                           end
                         end)

                       {meta, body}

                     _ ->
                       {%{}, rest}
                   end

                 _ ->
                   {%{}, raw}
               end

             title =
               Map.get(meta, "title") ||
                 rel
                 |> Path.basename()
                 |> String.replace("-", " ")
                 |> String.split()
                 |> Enum.map_join(" ", &String.capitalize/1)

             {rel,
              %Page{
                path: rel,
                title: title,
                description: Map.get(meta, "description"),
                body: String.trim(body),
                file: file
              }}
           end)
         )

  @nav elem(Code.eval_file(@nav_path), 0)

  @doc "All pages keyed by URL path (e.g. \"components/button\")."
  def pages, do: @pages

  @doc "Sidebar navigation tree from docs/nav.exs."
  def nav, do: @nav

  @doc "Default landing path."
  def home_path do
    case @nav do
      [%{items: [%{path: path} | _]} | _] -> path
      _ -> "overview/getting-started"
    end
  end

  @doc "Fetch a page by path or raise."
  def fetch!(path) when is_binary(path) do
    Map.get(@pages, path) || raise ArgumentError, "unknown docs page: #{path}"
  end

  def fetch(path) when is_binary(path), do: Map.fetch(@pages, path)
end
