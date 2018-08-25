defmodule DeckhubWeb.Api.V1.MarkdownView do
  @moduledoc """
  View functions for returning Markdown via the API.
  """
  use DeckhubWeb, :view

  def render("render_markdown.json", %{html: html}), do: %{html: html}
end
