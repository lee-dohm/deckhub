defmodule Deckhub.Text do
  @moduledoc """
  Functions for converting text from one format to another.
  """

  @doc """
  Converts `text` from a `Card` object's description into Markdown format.
  """
  def to_markdown(nil), do: nil

  def to_markdown(text) do
    text
    |> String.replace(~r{<b>(.+?)</b>}, "**\\1**")
    |> String.replace(~r{<i>(.+?)</i>}, "_\\1_")
    |> String.replace(~r{^\[x\]}, "", global: false)
    |> String.replace(~r{\n}, " ")
  end

  @doc """
  Converts `text` from a `Card` object's description into Slack's proprietary Markdown format.
  """
  def to_slackmark(nil), do: nil

  def to_slackmark(text) do
    text
    |> String.replace(~r{<b>(.+?)</b>}, "*\\1*")
    |> String.replace(~r{<i>(.+?)</i>}, "_\\1_")
    |> String.replace(~r{^\[x\]}, "", global: false)
    |> String.replace(~r{\n}, " ")
  end

  @doc """
  Converts `text` into slug form.
  """
  def to_slug(text) do
    text
    |> String.trim()
    |> String.downcase()
    |> String.replace(~r/\s+/, "-")
    |> String.replace(~r/[^a-z0-9\-]+/, "")
    |> String.replace(~r/\-\-+/, "-")
  end
end
