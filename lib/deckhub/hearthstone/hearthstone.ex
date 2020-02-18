defmodule Deckhub.Hearthstone do
  @moduledoc """
  Context for dealing with all Hearthstone game data such as cards, card backs, and heroes.
  """

  import Ecto.Query, warn: false

  alias Deckhub.Repo
  alias Deckhub.Hearthstone.Card
  alias Deckhub.Hearthstone.Term

  @doc """
  Returns the list of cards.

  ## Examples

  ```
  iex> Deckhub.Hearthstone.list_cards()
  [%Card{}, ...]
  ```
  """
  def list_cards do
    Repo.all(Card)
  end

  @doc """
  Returns the list of terms in the database.

  ## Examples

  ```
  iex> Deckhub.Hearthstone.list_terms()
  [%Term{}, ...]
  ```
  """
  def list_terms do
    Repo.all(Term)
  end

  @doc """
  Gets a single card by either its `dbf_id` or its `slug_name`.

  Raises `Ecto.NoResultsError` if the Card does not exist.

  ## Examples

  ```
  iex> get_card!(662)
  %Card{slug_name: "frostbolt", dbf_id: 662, ...}

  iex> get_card!("frostbolt")
  %Card{slug_name: "frostbolt", dbf_id: 662, ...}

  iex> get_card!("not-a-card")
  ** (Ecto.NoResultsError)
  ```
  """
  def get_card!(dbf_id) when is_integer(dbf_id), do: Repo.get_by!(Card, dbf_id: dbf_id)
  def get_card!(slug_name) when is_binary(slug_name), do: Repo.get_by!(Card, slug_name: slug_name)

  @doc """
  Gets a term by its `key`.

  Raises `Ecto.NoResultsError` if the `Term` does not exist.

  ## Examples

  ```
  iex> Deckhub.Hearthstone.get_term!("some-term")
  %Term{}
  ```
  """
  def get_term!(key), do: Repo.get_by!(Term, key: key)

  @doc """
  Creates a card.

  ## Examples

  ```
  iex> create_card(%{field: value})
  {:ok, %Card{}}

  iex> create_card(%{field: bad_value})
  {:error, %Ecto.Changeset{}}
  ```
  """
  def create_card(attrs \\ %{}) do
    %Card{}
    |> Card.changeset(attrs)
    |> Repo.insert()
  end

  def create_term(attrs \\ %{}) do
    %Term{}
    |> Term.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a card.

  ## Examples

  ```
  iex> update_card(card, %{field: new_value})
  {:ok, %Card{}}

  iex> update_card(card, %{field: bad_value})
  {:error, %Ecto.Changeset{}}
  ```
  """
  def update_card(%Card{} = card, attrs) do
    card
    |> Card.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Card.

  ## Examples

  ```
  iex> delete_card(card)
  {:ok, %Card{}}

  iex> delete_card(card)
  {:error, %Ecto.Changeset{}}
  ```
  """
  def delete_card(%Card{} = card) do
    Repo.delete(card)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking card changes.

  ## Examples

  ```
  iex> change_card(card)
  %Ecto.Changeset{source: %Card{}}
  ```
  """
  def change_card(%Card{} = card) do
    Card.changeset(card, %{})
  end
end
