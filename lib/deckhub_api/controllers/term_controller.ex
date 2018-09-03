defmodule DeckhubApi.TermController do
  @moduledoc """
  Handles requests for glossary terms.
  """

  use DeckhubApi, :controller

  alias Deckhub.Hearthstone

  def index(conn, _params) do
    conn
  end

  def show(conn, %{"key" => key}) do
    term = Hearthstone.get_term!(key)

    render(conn, "show.json", %{term: term})
  end
end
