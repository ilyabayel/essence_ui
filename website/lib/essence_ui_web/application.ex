defmodule EssenceUIWeb.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EssenceUIWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:essence_ui_web, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EssenceUIWeb.PubSub},
      EssenceUIWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: EssenceUIWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    EssenceUIWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
