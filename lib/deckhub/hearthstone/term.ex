defmodule Deckhub.Hearthstone.Term do
  @moduledoc """
  Represents a Hearthstone term definition.
  """

  use Ecto.Schema

  alias Deckhub.Ecto.Markdown

  import Ecto.Changeset

  schema "terms" do
    field :key, :string
    field :value, Markdown

    timestamps()
  end

  @doc false
  def changeset(term, attrs) do
    term
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
