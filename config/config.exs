# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :cors_plug,
  origin: ["http://localhost:3000"],
  max_age: 86400,
  methods: ["GET", "POST"]

# General application configuration
config :critistry_api,
  ecto_repos: [CritistryApi.Repo]

# Configures the endpoint
config :critistry_api, CritistryApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GoG2jj73w/4pRBl6YxfTA9G/Fecz5xzYM+RPJGzb2yKMFoKMT3Q6NvIJy0drOL0L",
  render_errors: [view: CritistryApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CritistryApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
