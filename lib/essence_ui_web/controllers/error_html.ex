defmodule EssenceUIWeb.ErrorHTML do
  @moduledoc """
  Renders HTML error pages.
  """
  use EssenceUIWeb, :html
  require Logger

  # The default is to render a plain text page based on
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def render(template, assigns) do
    # #region agent log
    reason = Map.get(assigns, :reason)
    kind = Map.get(assigns, :kind)
    stack = Map.get(assigns, :stack) || []

    formatted =
      if is_exception(reason) do
        Exception.format(kind || :error, reason, stack)
      else
        inspect(reason, limit: 50)
      end

    Logger.error("debug_ff6686 root_exception template=#{template} detail=#{formatted}")

    _ =
      try do
        File.write!(
          "/tmp/debug-ff6686.log",
          Jason.encode!(%{
            sessionId: "ff6686",
            runId: "runtime-1",
            hypothesisId: "R1",
            location: "error_html.ex:render",
            message: "caught request error",
            data: %{template: template, detail: String.slice(formatted, 0, 4000)},
            timestamp: System.system_time(:millisecond)
          }) <> "\n",
          [:append]
        )
      rescue
        _ -> :ok
      end

    # #endregion

    Phoenix.Controller.status_message_from_template(template)
  end
end
