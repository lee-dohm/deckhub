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
    resources("/glossary", TermController, only: [:index, :show], param: "key")

    post("/markdown", MarkdownController, :render_markdown)

    post("/slack", SlackController, :slash_command)
  end
end
