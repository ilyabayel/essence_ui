defmodule EssenceUIWeb.RedirectController do
  use EssenceUIWeb, :controller

  def themes(conn, _params) do
    redirect(conn, to: "/")
  end
end
