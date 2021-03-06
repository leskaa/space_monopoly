# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :space_monopoly,
  ecto_repos: [SpaceMonopoly.Repo]

# Configures the endpoint
config :space_monopoly, SpaceMonopolyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5JyRGPAT1QZnrk/2vVgRonbyrnHWwyRno8ceQcn6SCxY5p6uw41rM1uSxpyFVl1h",
  render_errors: [view: SpaceMonopolyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SpaceMonopoly.PubSub,
  live_view: [signing_salt: "pOKmnfcG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
