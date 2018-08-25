# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Deckhub.Repo.insert!(%Deckhub.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Deckhub.Repo
alias Deckhub.Hearthstone

Repo.insert!(
  %Hearthstone.Card{
    artist: "Alex Horley Orlandelli",
    attack: 4,
    character_class: "neutral",
    collectible: true,
    durability: nil,
    extra_text: "**Taunt. Deathrattle:** Deal 2 damage to ALL characters.",
    flavor_text: "Abominations enjoy Fresh Meat and long walks on the beach.",
    health: 4,
    mana: 5,
    minion_class: nil,
    name: "Abomination",
    quality: "rare",
    set: "classic",
    slug: "abomination",
    type: "minion"
  }
)
