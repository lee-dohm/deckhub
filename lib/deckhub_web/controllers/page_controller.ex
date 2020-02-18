defmodule DeckhubWeb.PageController do
  @moduledoc """
  Handles requests for root-level pages.
  """

  use DeckhubWeb, :controller

  def about(conn, _params) do
    render(conn, "about.html")
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
