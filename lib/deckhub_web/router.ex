defmodule DeckhubWeb.Router do
  use DeckhubWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", DeckhubWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", DeckhubWeb.Api.V1 do
    pipe_through(:api)

    get("/markdown", MarkdownController, :render_markdown)
  end
end
