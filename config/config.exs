# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mbtadepartures,
  namespace: Departures

# Configures the endpoint
config :mbtadepartures, Departures.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KXybF5AkJ4NrSGBN58hPbeX/aW4gIT0qpT6aDVfJj7nujjtfRG7b3/68/2Mt+C9P",
  render_errors: [view: Departures.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Departures.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
