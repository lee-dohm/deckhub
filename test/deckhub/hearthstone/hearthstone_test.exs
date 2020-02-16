defmodule Deckhub.HearthstoneTest do
  use Deckhub.DataCase

  alias Deckhub.Hearthstone

  import Deckhub.Factory

  describe "cards" do
    alias Deckhub.Hearthstone.Card

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
      type: "SPELL",
      small_image: "some updated small image"
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
      type: nil,
      small_image: nil
    }

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Hearthstone.create_card()

      card
    end

    test "list_cards/0 returns all cards" do
      card = insert(:card)

      assert Hearthstone.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = insert(:card)

      assert Hearthstone.get_card!(card.card_id) == card
    end

    test "create_card/1 with valid data creates a card" do
      params = params_for(:card)
      {:ok, card} = Hearthstone.create_card(params)

      assert card.armor == params.armor
      assert card.artist == params.artist
      assert card.attack == params.attack
      assert card.card_class == params.card_class
      assert card.card_id == params.card_id
      assert card.collectible == params.collectible
      assert card.cost == params.cost
      assert card.dbf_id == params.dbf_id
      assert card.durability == params.durability
      assert card.elite == params.elite
      assert card.flavor == params.flavor
      assert card.health == params.health
      assert card.image == params.image
      assert card.name == params.name
      assert card.race == params.race
      assert card.rarity == params.rarity
      assert card.set == params.set
      assert card.slug_name == params.slug_name
      assert card.text == params.text
      assert card.type == params.type
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
      card = insert(:card)

      assert {:error, %Ecto.Changeset{}} = Hearthstone.update_card(card, @invalid_attrs)
      assert card == Hearthstone.get_card!(card.card_id)
    end

    test "delete_card/1 deletes the card" do
      card = insert(:card)

      assert {:ok, %Card{}} = Hearthstone.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Hearthstone.get_card!(card.card_id) end
    end

    test "change_card/1 returns a card changeset" do
      card = insert(:card)

      assert %Ecto.Changeset{} = Hearthstone.change_card(card)
    end

    test "minion?/1 returns true when given a MINION" do
      card = insert(:card, %{type: "MINION"})

      assert Card.minion?(card)
    end

    test "minion?/1 returns false when given another kind of card" do
      card = insert(:card, %{type: "SPELL"})

      refute Card.minion?(card)
    end

    test "minion?/1 throws when given something other than a card" do
      assert_raise FunctionClauseError, fn -> Card.minion?(5) end
    end

    test "spell?/1 returns true when given a SPELL" do
      card = insert(:card, %{type: "SPELL"})

      assert Card.spell?(card)
    end

    test "spell?/1 returns false when given another kind of card" do
      card = insert(:card, %{type: "WEAPON"})

      refute Card.spell?(card)
    end

    test "spell?/1 throws when given something other than a card" do
      assert_raise FunctionClauseError, fn -> Card.spell?(5) end
    end

    test "weapon?/1 returns true when given a WEAPON" do
      card = insert(:card, %{type: "WEAPON"})

      assert Card.weapon?(card)
    end

    test "weapon?/1 returns false when given another kind of card" do
      card = insert(:card, %{type: "HERO"})

      refute Card.weapon?(card)
    end

    test "weapon?/1 throws when given something other than a card" do
      assert_raise FunctionClauseError, fn -> Card.weapon?(5) end
    end
  end
end
