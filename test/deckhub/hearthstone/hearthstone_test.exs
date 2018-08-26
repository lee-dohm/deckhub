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
      assert Hearthstone.get_card!(card.card_id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Hearthstone.create_card(@valid_attrs)
      assert card.armor == 42
      assert card.artist == "some artist"
      assert card.attack == 42
      assert card.card_class == "some card_class"
      assert card.card_id == "CARD_01"
      assert card.collectible == true
      assert card.cost == 42
      assert card.dbf_id == 42
      assert card.durability == 42
      assert card.elite == false
      assert card.flavor == "some flavor"
      assert card.health == 42
      assert card.image == "some image"
      assert card.name == "some name"
      assert card.race == "MURLOC"
      assert card.rarity == "COMMON"
      assert card.set == "CORE"
      assert card.slug_name == "some-name"
      assert card.text == "some text"
      assert card.type == "MINION"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hearthstone.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, card} = Hearthstone.update_card(card, @update_attrs)
      assert %Card{} = card
      assert card.armor == 43
      assert card.artist == "some updated artist"
      assert card.attack == 43
      assert card.card_class == "some updated card_class"
      assert card.card_id == "CARD_01"
      assert card.collectible == true
      assert card.cost == 43
      assert card.dbf_id == 43
      assert card.durability == 43
      assert card.elite == false
      assert card.flavor == "some updated flavor"
      assert card.health == 43
      assert card.image == "some updated image"
      assert card.name == "some updated name"
      assert card.race == "PIRATE"
      assert card.rarity == "RARE"
      assert card.set == "BOOMSDAY"
      assert card.slug_name == "some-updated-name"
      assert card.text == "some updated text"
      assert card.type == "SPELL"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Hearthstone.update_card(card, @invalid_attrs)
      assert card == Hearthstone.get_card!(card.card_id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Hearthstone.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Hearthstone.get_card!(card.card_id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Hearthstone.change_card(card)
    end
  end
end
