defmodule DeckhubWeb.PageController do
  use DeckhubWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
