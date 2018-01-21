use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :record_shop, RecordShopWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :record_shop, RecordShop.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "record_shop_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
