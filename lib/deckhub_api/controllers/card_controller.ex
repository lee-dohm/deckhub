defmodule DeckhubApi.CardController do
  @moduledoc """
  Handles requests for cards.
  """

  use DeckhubApi, :controller

  alias Deckhub.Hearthstone

  require Logger

  @doc """
  Returns the list of cards.
  """
  def index(conn, _params) do
    conn
  end

  @doc """
  Returns the data on an individual card.
  """
  def show(conn, %{"slug" => slug}) do
    card = Hearthstone.get_card_by_slug_name!(slug)

    render(conn, "show.json", %{card: card})
  end
end
