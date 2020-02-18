defmodule DeckhubWeb.CardController do
  @moduledoc """
  Handles requests for card routes.
  """

  use DeckhubWeb, :controller

  alias Deckhub.Hearthstone

  def show(conn, %{"id" => id}) do
    card = Hearthstone.get_card!(id)

    render(conn, "show.html", card: card)
  end
end
