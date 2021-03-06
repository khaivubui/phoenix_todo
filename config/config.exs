# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :simple_todo,
  ecto_repos: [SimpleTodo.Repo]

# Configures the endpoint
config :simple_todo, SimpleTodoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HZMS4y3GsFiLnsIyLuy0U3dTGIaVmRQ+xPNFcx0qzDUJx212y9XRpDFF2br/p+lA",
  render_errors: [view: SimpleTodoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SimpleTodo.PubSub,
           adapter: Phoenix.PubSub.PG2],
  http: [protocol_options: [max_request_line_length: 8192, max_header_value_length: 8192]]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
