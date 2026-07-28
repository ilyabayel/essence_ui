defmodule EssenceUIWeb.Router do
  use EssenceUIWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {EssenceUIWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  if Application.compile_env(:essence_ui_web, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: EssenceUIWeb.Telemetry
    end
  end

  scope "/" do
    pipe_through(:browser)
  end

  scope "/crm", EssenceUIWeb do
    pipe_through :browser
    live "/", CRM.DashboardLive, :index
  end

  scope "/", EssenceUIWeb do
    pipe_through :browser

    live "/", Marketing.ThemesHomeLive, :index
    get "/themes", RedirectController, :themes

    live "/themes/playground", PlaygroundLive, :index

    live "/primitives", Marketing.PrimitivesHomeLive, :index
    live "/colors", Marketing.ColorsHomeLive, :index

    live "/themes/docs", Docs.PageLive, :index
    live "/themes/docs/*path", Docs.PageLive, :show

    live "/primitives/docs", Docs.PageLive, :index
    live "/primitives/docs/*path", Docs.PageLive, :show

    live "/colors/docs", Docs.PageLive, :index
    live "/colors/docs/*path", Docs.PageLive, :show
  end
end
