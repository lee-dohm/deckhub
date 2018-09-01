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

  scope "/api", DeckhubApi, as: :api do
    pipe_through(:api)

    resources("/cards", CardController, only: [:index, :show], param: "slug")

    get("/markdown", MarkdownController, :render_markdown)

    post("/slack", SlackController, :slash_command)
  end

  scope "/", DeckhubWeb do
    pipe_through(:browser)

    get("/*path", PageController, :index)
  end
end
