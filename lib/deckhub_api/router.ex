defmodule DeckhubApi.Router do
  @moduledoc """
  Defines mappings from web routes to controllers and their functions.
  """
  use DeckhubApi, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", DeckhubApi, as: :api do
    pipe_through(:api)

    resources("/cards", CardController, only: [:index, :show], param: "slug")

    get("/markdown", MarkdownController, :render_markdown)

    post("/slack", SlackController, :slash_command)
  end
end
