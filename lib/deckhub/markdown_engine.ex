defmodule Deckhub.MarkdownEngine do
  @moduledoc """
  Functions relating to rendering Markdown.
  """

  @doc """
  Renders the supplied Markdown text into an HTML fragment with the supplied options.

  For available options see `Cmark.to_html/2`.
  """
  def render(text, options \\ [:safe, :smart, :validate_utf8]) do
    Cmark.to_html(text, options)
  end
end
