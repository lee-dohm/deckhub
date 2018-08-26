defmodule DeckhubApi.MarkdownControllerTest do
  use DeckhubWeb.ConnCase

  test "renders the markdown requested", context do
    markdown = "Testing... 1... 2... 3..."
    path = api_markdown_path(context.conn, :render_markdown, %{"text" => markdown})
    conn = get(context.conn, path)

    assert json_response(conn, :ok) == %{"html" => "<p>Testing… 1… 2… 3…</p>\n"}
  end
end
