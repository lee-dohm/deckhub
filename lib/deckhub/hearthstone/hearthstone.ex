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
  iex> list_cards()
  [%Card{}, ...]
  ```

  """
  def list_cards do
    Repo.all(Card)
  end

  def list_terms do
    Repo.all(Term)
  end

  @doc """
  Gets a single card by its `card_id`.

  Raises `Ecto.NoResultsError` if the Card does not exist.

  ## Examples

  ```
  iex> get_card!("CARD_01")
  %Card{}

  iex> get_card!("not-a-card")
  ** (Ecto.NoResultsError)
  ```
  """
  def get_card!(card_id), do: Repo.get_by!(Card, card_id: card_id)

  @doc """
  Gets a single card by its `slug_name`.

  Raises `Ecto.NoResultsError` if the Card doees not exist.

  ## Examples

  ```
  iex> get_card!("abomination")
  %Card{}

  iex> get_card!("not-a-card")
  ** (Ecto.NoResultsError)
  ```
  """
  def get_card_by_slug_name!(slug_name), do: Repo.get_by!(Card, slug_name: slug_name)

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
