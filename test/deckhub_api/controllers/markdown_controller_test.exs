defmodule DeckhubApi.MarkdownControllerTest do
  use DeckhubApi.ConnCase

  test "renders the markdown requested", context do
    markdown = "Testing... 1... 2... 3..."
    path = "/api" <> api_markdown_path(context.conn, :render_markdown)
    conn = post(context.conn, path, %{"text" => markdown})

    assert json_response(conn, :ok) == %{"html" => "<p>Testing… 1… 2… 3…</p>\n"}
  end
end
