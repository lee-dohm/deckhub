defmodule DeckhubWeb.Api.V1.MarkdownController do
  @moduledoc """
  Handles requests to render Markdown.
  """

  use DeckhubWeb, :controller

  alias Deckhub.MarkdownEngine

  @doc """
  Renders Markdown into HTML.

  ## Examples

  Sample request:

  ```json
  {
    "text": "Testing... 1... 2... 3..."
  }
  ```

  Sample response:

  ```json
  {
    "html": "<p>Testing… 1… 2… 3…</p>"
  }
  ```
  """
  def render_markdown(conn, %{"text" => text}) do
    render(conn, "render_markdown.json", html: MarkdownEngine.render(text))
  end
end
