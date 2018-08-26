defmodule Deckhub.Hearthstone.Card do
  @moduledoc """
  Represents an individual Hearthstone card.

  * `armor` -- Armor value of the hero
  * `artist` -- Name of the artist that designed the card's art
  * `attack` -- Amount of damage the card causes when used to attack
  * `card_class` -- Class that can use the card or `NEUTRAL` if it can be used by any class
  * `card_id` -- Guaranteed unique identifier for the card
  * `collectible` -- `true` if the card can be collected
  * `cost` -- Mana cost to cast the spell, equip the weapon, or summon the minion
  * `dbf_id` -- Numeric id of the card
  * `durability` -- Starting durability of a weapon
  * `elite` -- I have no clue what this means
  * `flavor` -- Flavor text when viewing the detail of the card
  * `health` -- Starting health of the minion
  * `image` -- URL of the card image
  * `name` -- Name of the card
  * `race` -- Type of minion, if any, such as `BEAST`, `MURLOC`, or `PIRATE`
  * `rarity` -- Quality of the card: `FREE`, `COMMON`, `RARE`, `EPIC`, or `LEGENDARY`
  * `set` -- The set the card was released in
  * `slug_name` -- Slug version of the card name for lookup when the `card_id` isn't known
  * `text` -- Text on the front of the card
  * `type` -- Type of the card: `HERO`, `MINION`, `SPELL`, or `WEAPON`
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field(:armor, :integer)
    field(:artist, :string)
    field(:attack, :integer)
    field(:card_class, :string)
    field(:card_id, :string)
    field(:collectible, :boolean)
    field(:cost, :integer)
    field(:dbf_id, :integer)
    field(:durability, :integer)
    field(:elite, :boolean)
    field(:flavor, :string)
    field(:health, :integer)
    field(:image, :string)
    field(:name, :string)
    field(:race, :string)
    field(:rarity, :string)
    field(:set, :string)
    field(:slug_name, :string)
    field(:text, :string)
    field(:type, :string)

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [
      :armor,
      :artist,
      :attack,
      :card_class,
      :card_id,
      :collectible,
      :cost,
      :dbf_id,
      :durability,
      :elite,
      :flavor,
      :health,
      :image,
      :name,
      :race,
      :rarity,
      :set,
      :slug_name,
      :text,
      :type
    ])
    |> validate_required([
      :card_class,
      :card_id,
      :collectible,
      :dbf_id,
      :image,
      :name,
      :rarity,
      :set,
      :slug_name,
      :type
    ])
  end

  defimpl Phoenix.Param, for: Deckhub.Hearthstone.Card do
    def to_param(%Deckhub.Hearthstone.Card{card_id: card_id, name: name}) do
      "#{card_id}-#{Deckhub.Text.to_slug(name)}"
    end
  end
end
