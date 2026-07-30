defmodule EssenceUIWeb.Docs.Catalog do
  @moduledoc false

  alias EssenceUIWeb.Docs.Page

  @content_root Path.expand("../../../docs/content", __DIR__)
  @nav_dir Path.expand("../../../docs/nav", __DIR__)
  @sections [:themes, :primitives, :colors]

  @external_resource Path.join(@nav_dir, "themes.exs")
  @external_resource Path.join(@nav_dir, "primitives.exs")
  @external_resource Path.join(@nav_dir, "colors.exs")

  for path <- Path.wildcard(Path.join(@content_root, "**/*.md")) do
    @external_resource path
  end

  @pages (
           content_root = Path.expand("../../../docs/content", __DIR__)

           parse_frontmatter = fn
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

             raw ->
               {%{}, raw}
           end

           content_root
           |> Path.join("**/*.md")
           |> Path.wildcard()
           |> Map.new(fn file ->
             rel =
               file
               |> Path.relative_to(content_root)
               |> String.replace_suffix(".md", "")

             raw = File.read!(file)
             {meta, body} = parse_frontmatter.(raw)

             title =
               Map.get(meta, "title") ||
                 rel
                 |> Path.basename()
                 |> String.replace("-", " ")
                 |> String.split()
                 |> Enum.map_join(" ", &String.capitalize/1)

             section =
               case String.split(rel, "/", parts: 2) do
                 [sec, _] when sec in ["themes", "primitives", "colors"] -> String.to_atom(sec)
                 _ -> :themes
               end

             page_path =
               case String.split(rel, "/", parts: 2) do
                 [_sec, rest] -> rest
                 [only] -> only
               end

             {rel,
              %Page{
                path: page_path,
                full_path: rel,
                section: section,
                title: title,
                description: Map.get(meta, "description"),
                body: String.trim(body),
                file: file
              }}
           end)
         )

  @navs (
          nav_dir = Path.expand("../../../docs/nav", __DIR__)

          Map.new([:themes, :primitives, :colors], fn section ->
            path = Path.join(nav_dir, "#{section}.exs")
            {section, elem(Code.eval_file(path), 0)}
          end)
        )

  @doc "All pages keyed by full content path (e.g. \"themes/components/button\")."
  def pages, do: @pages

  @doc """
  Inject `code={...}` on `<:heex>` slots that omit it, using the slot body.

  Primitive docs author live markup inside `<:heex>` without a duplicate `code`
  attr; `<.demo>` only shows the HEEx tab when `code` is present. Themes pages
  that already pass `code=` are left unchanged.

  Uses `inspect/1` so the attribute stays a single-line Elixir string literal
  (MDEx swallows multiline HEEx attrs).
  """
  def inject_heex_slot_code(body) when is_binary(body) do
    Regex.replace(~r/<:heex((?:\s[^>]*)?)>(.*?)<\/:heex>/s, body, fn full, attrs, inner ->
      if Regex.match?(~r/\bcode\s*=/, attrs) do
        full
      else
        case String.trim(inner) do
          "" ->
            full

          code ->
            "<:heex#{attrs} code={#{inspect(code)}}>#{inner}</:heex>"
        end
      end
    end)
  end

  @doc "Sidebar navigation for a section."
  def nav(section) when section in @sections, do: Map.fetch!(@navs, section)

  @doc "Default landing path within a section."
  def home_path(section) when section in @sections do
    case nav(section) do
      [%{items: [%{path: path} | _]} | _] -> path
      _ -> "overview/getting-started"
    end
  end

  def sections, do: @sections

  @doc "Fetch by section + relative page path."
  def fetch(section, path) when section in @sections and is_binary(path) do
    full = "#{section}/#{path}"
    Map.fetch(@pages, full)
  end

  def fetch!(section, path) do
    case fetch(section, path) do
      {:ok, page} -> page
      :error -> raise ArgumentError, "unknown docs page: #{section}/#{path}"
    end
  end

  @doc "Previous/next pages within section nav order."
  def siblings(section, path) when section in @sections do
    flat =
      section
      |> nav()
      |> Enum.flat_map(& &1.items)
      |> Enum.map(& &1.path)

    case Enum.find_index(flat, &(&1 == path)) do
      nil ->
        {nil, nil}

      idx ->
        prev = if idx > 0, do: Enum.at(flat, idx - 1)
        next = Enum.at(flat, idx + 1)
        {prev && fetch!(section, prev), next && fetch!(section, next)}
    end
  end
end
