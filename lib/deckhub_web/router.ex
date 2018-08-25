defmodule DeckhubWeb.Router do
  @moduledoc """
  Defines mappings from web routes to controllers and their functions.
  """
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
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/api", DeckhubApi do
    pipe_through(:api)

    get("/markdown", MarkdownController, :render_markdown)
  end
end
