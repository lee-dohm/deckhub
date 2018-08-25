defmodule DeckhubApi.MarkdownView do
  @moduledoc """
  View functions for returning Markdown via the API.
  """
  use DeckhubApi, :view

  def render("render_markdown.json", %{html: html}), do: %{html: html}
end
