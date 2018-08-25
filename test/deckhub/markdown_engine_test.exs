defmodule Deckhub.MarkdownEngineTest do
  use ExUnit.Case

  alias Deckhub.MarkdownEngine, as: Engine

  describe "rendering" do
    test "a simple Markdown text", _context do
      assert Engine.render("Testing... 1... 2... 3...") == "<p>Testing… 1… 2… 3…</p>\n"
    end
  end
end
