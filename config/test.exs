use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :deckhub, DeckhubWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :deckhub, Deckhub.Repo,
  username: "postgres",
  password: "postgres",
  database: "deckhub_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :ex_doc, :markdown_processor, ExDoc.Markdown.Cmark
