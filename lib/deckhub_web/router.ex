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

  forward("/api", DeckhubApi.Router)

  scope "/", DeckhubWeb do
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/about", PageController, :about)

    resources("/cards", CardController, only: [:show])
  end
end
