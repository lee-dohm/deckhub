defmodule Deckhub.HearthstoneTest do
  use Deckhub.DataCase

  alias Deckhub.Hearthstone

  describe "cards" do
    alias Deckhub.Hearthstone.Card

    @valid_attrs %{
      armor: 42,
      artist: "some artist",
      attack: 42,
      card_class: "some card_class",
      card_id: "CARD_01",
      collectible: true,
      cost: 42,
      dbf_id: 42,
      durability: 42,
      elite: false,
      flavor: "some flavor",
      health: 42,
      image: "some image",
      name: "some name",
      race: "MURLOC",
      rarity: "COMMON",
      set: "CORE",
      slug_name: "some-name",
      text: "some text",
      type: "MINION"
    }

    @update_attrs %{
      armor: 43,
      artist: "some updated artist",
      attack: 43,
      card_class: "some updated card_class",
      card_id: "CARD_01",
      collectible: true,
      cost: 43,
      dbf_id: 43,
      durability: 43,
      elite: false,
      flavor: "some updated flavor",
      health: 43,
      image: "some updated image",
      name: "some updated name",
      race: "PIRATE",
      rarity: "RARE",
      set: "BOOMSDAY",
      slug_name: "some-updated-name",
      text: "some updated text",
      type: "SPELL"
    }

    @invalid_attrs %{
      armor: nil,
      artist: nil,
      attack: nil,
      card_class: nil,
      card_id: nil,
      collectible: nil,
      cost: nil,
      dbf_id: nil,
      durability: nil,
      elite: nil,
      flavor: nil,
      health: nil,
      image: nil,
      name: nil,
      race: nil,
      rarity: nil,
      set: nil,
      slug_name: nil,
      text: nil,
      type: nil
    }

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hearthstone.create_card()

      card
    end

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Hearthstone.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Hearthstone.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Hearthstone.create_card(@valid_attrs)
      assert card.artist == "some artist"
      assert card.attack == 42
      assert card.character_class == "some character_class"
      assert card.collectible == true
      assert card.durability == 42
      assert card.extra_text == "some extra_text"
      assert card.flavor_text == "some flavor_text"
      assert card.health == 42
      assert card.mana == 42
      assert card.minion_class == "some minion_class"
      assert card.name == "some name"
      assert card.quality == "some quality"
      assert card.set == "some set"
      assert card.type == "some type"
      assert card.slug == "some-name"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hearthstone.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, card} = Hearthstone.update_card(card, @update_attrs)
      assert %Card{} = card
      assert card.artist == "some updated artist"
      assert card.attack == 43
      assert card.character_class == "some updated character_class"
      assert card.collectible == false
      assert card.durability == 43
      assert card.extra_text == "some updated extra_text"
      assert card.flavor_text == "some updated flavor_text"
      assert card.health == 43
      assert card.mana == 43
      assert card.minion_class == "some updated minion_class"
      assert card.name == "some updated name"
      assert card.quality == "some updated quality"
      assert card.set == "some updated set"
      assert card.type == "some updated type"
      assert card.slug == "some-updated-name"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Hearthstone.update_card(card, @invalid_attrs)
      assert card == Hearthstone.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Hearthstone.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Hearthstone.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Hearthstone.change_card(card)
    end
  end
end
