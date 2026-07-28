defmodule EssenceUI.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = application_children()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EssenceUI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    if docs_endpoint_available?() do
      EssenceUIWeb.Endpoint.config_change(changed, removed)
    end

    :ok
  end

  # The docs/demo Phoenix app (`EssenceUIWeb`) ships in this repo for local
  # development, but is excluded from the Hex package. When used as a
  # dependency, start a no-op supervisor so consumers are unaffected.
  defp application_children do
    if docs_endpoint_available?() do
      [
        EssenceUIWeb.Telemetry,
        {DNSCluster, query: Application.get_env(:essence_ui, :dns_cluster_query) || :ignore},
        {Phoenix.PubSub, name: EssenceUI.PubSub},
        EssenceUIWeb.Endpoint
      ]
    else
      []
    end
  end

  defp docs_endpoint_available? do
    Code.ensure_loaded?(EssenceUIWeb.Endpoint)
  end
end
