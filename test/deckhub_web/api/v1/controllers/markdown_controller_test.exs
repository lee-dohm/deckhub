defmodule DeckhubWeb.Api.V1.MarkdownControllerTest do
  use DeckhubWeb.ConnCase

  test "renders the markdown requested", context do
    markdown = "Testing... 1... 2... 3..."
    conn = get(context.conn, markdown_path(context.conn, :render_markdown, %{"text" => markdown}))

    assert json_response(conn, :ok) == %{"html" => "<p>Testing… 1… 2… 3…</p>\n"}
  end
end
