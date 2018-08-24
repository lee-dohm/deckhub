defmodule Deckhub.Hearthstone.Card do
  @moduledoc """
  Represents an individual Hearthstone card.

  * `artist` -- Name of the artist that designed the card's art
  * `attack` -- Amount of damage the card causes when used to attack
  * `character_class` -- Class that can use the card or `neutral` if it can be used by any class
  * `collectible` -- `true` if the card can be collected
  * `durability` -- Starting durability of a weapon
  * `extra_text` -- Extra text on the front of the card, in Markdown
  * `flavor_text` -- Flavor text when viewing the detail of the card
  * `health` -- Starting health of the minion
  * `mana` -- Mana cost to cast the spell, equip the weapon, or summon the minion
  * `minion_class` -- Type of minion, if any, such as `beast`, `murloc`, or `pirate`
  * `name` -- Name of the card
  * `quality` -- Quality of the card: `common`, `rare`, `epic`, or `legendary`
  * `set` -- The set the card was released in
  * `slug` -- The friendly ID for the card in URLs
  * `type` -- Type of the card: `minion`, `spell`, or `weapon`
  """

  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :slug}

  schema "cards" do
    field(:artist, :string)
    field(:attack, :integer)
    field(:character_class, :string)
    field(:collectible, :boolean, default: false)
    field(:durability, :integer)
    field(:extra_text, :string)
    field(:flavor_text, :string)
    field(:health, :integer)
    field(:mana, :integer)
    field(:minion_class, :string)
    field(:name, :string)
    field(:quality, :string)
    field(:set, :string)
    field(:slug, :string)
    field(:type, :string)

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [
      :name,
      :type,
      :character_class,
      :set,
      :quality,
      :mana,
      :attack,
      :health,
      :durability,
      :minion_class,
      :extra_text,
      :flavor_text,
      :artist,
      :collectible,
      :slug
    ])
    |> validate_required([
      :name,
      :type,
      :character_class,
      :set,
      :quality,
      :mana,
      :attack,
      :health,
      :durability,
      :minion_class,
      :extra_text,
      :flavor_text,
      :artist,
      :collectible,
      :slug
    ])
  end
end
