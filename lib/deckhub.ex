defmodule Deckhub do
  @moduledoc """
  Deckhub keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @doc """
  Converts `text` into slug form.
  """
  def to_slug(text) do
    text
    |> String.downcase()
    |> String.replace(~r/\s+/, "-")
    |> String.replace(~r/[^\w\-]+/, "")
    |> String.replace(~r/\-\-+/, "-")
    |> String.replace(~r/^-+/, "", global: false)
    |> String.replace(~r/-+$/, "", global: false)
  end
end
