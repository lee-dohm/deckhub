defmodule Deckhub.Factory do
  @moduledoc """
  Functions for generating realistic-looking data.
  """

  use ExMachina.Ecto, repo: Deckhub.Repo

  alias FakerElixir.Helper
  alias FakerElixir.Internet
  alias FakerElixir.Lorem
  alias FakerElixir.Name
  alias FakerElixir.Number

  alias Deckhub.Hearthstone
  alias Deckhub.Text

  def card_factory do
    name = Name.name()
    slug = Text.to_slug(name)

    %Hearthstone.Card{
      armor: Number.between(0..10),
      artist: Name.name(),
      attack: Number.between(0..10),
      card_class:
        Helper.pick([
          "PRIEST",
          "WARRIOR",
          "MAGE",
          "SHAMAN",
          "PALADIN",
          "HUNTER",
          "WARLOCK",
          "ROGUE",
          "DRUID"
        ]),
      card_id: "CARD_01",
      collectible: true,
      cost: Number.between(0..10),
      dbf_id: Number.between(0..90_000),
      durability: Number.between(0..10),
      elite: false,
      flavor: Lorem.sentence(),
      health: Number.between(0..10),
      image: Internet.url(),
      name: name,
      race: "MURLOC",
      rarity: Helper.pick(["COMMON", "RARE", "EPIC"]),
      set: "CORE",
      slug_name: slug,
      text: Lorem.sentence(),
      type: "MINION",
      small_image: Internet.url()
    }
  end
end
