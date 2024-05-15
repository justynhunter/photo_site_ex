defmodule PhotoSite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhotoSiteWeb.Telemetry,
      # Start the Ecto repository
      PhotoSite.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhotoSite.PubSub},
      # Start Finch
      {Finch, name: PhotoSite.Finch},
      # Start the Endpoint (http/https)
      PhotoSiteWeb.Endpoint
      # Start a worker by calling: PhotoSite.Worker.start_link(arg)
      # {PhotoSite.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhotoSite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhotoSiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
