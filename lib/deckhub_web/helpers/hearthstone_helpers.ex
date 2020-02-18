defmodule DeckhubWeb.HearthstoneHelpers do
  @moduledoc """
  Hearthstone helper functions for views.
  """

  use Phoenix.HTML

  alias Deckhub.Hearthstone.Card

  def from_dust(card, gold \\ nil)

  def from_dust(%Card{} = card, gold) do
    case {card.rarity, gold} do
      {"COMMON", nil} -> 40
      {"COMMON", _} -> 400
      {"RARE", nil} -> 100
      {"RARE", _} -> 800
      {"EPIC", nil} -> 400
      {"EPIC", _} -> 1_600
      {"LEGENDARY", nil} -> 1_600
      {"LEGENDARY", _} -> 3_200
    end
  end

  def to_dust(card, gold \\ nil)

  def to_dust(%Card{} = card, gold) do
    case {card.rarity, gold} do
      {"COMMON", nil} -> 5
      {"COMMON", _} -> 50
      {"RARE", nil} -> 20
      {"RARE", _} -> 100
      {"EPIC", nil} -> 100
      {"EPIC", _} -> 400
      {"LEGENDARY", nil} -> 400
      {"LEGENDARY", _} -> 1_600
    end
  end
end
