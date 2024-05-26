# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :photo_site,
  ecto_repos: [PhotoSite.Repo]

config :phoenix_turnstile,
  site_key: System.get_env("TURNSTILE_SITE_KEY"),
  secret_key: System.get_env("TURNSTILE_SECRET_KEY")

# Configures the endpoint
config :photo_site, PhotoSiteWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: PhotoSiteWeb.ErrorHTML, json: PhotoSiteWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: PhotoSite.PubSub,
  live_view: [signing_salt: "5694jZjD"]

config :kaffy,
  otp_app: :photo_site,
  ecto_repo: PhotoSite.Repo,
  router: PhotoSiteWeb.Router,
  admin_title: "PhotoSite",
  admin_logo: [
    url: "",
    style: ""
  ],
  admin_logo_mini: "",
  hide_dashboard: true,
  home_page: [schema: [:accounts, :user]]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :photo_site, PhotoSite.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
