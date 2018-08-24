defmodule Deckhub.HearthstoneTest do
  use Deckhub.DataCase

  alias Deckhub.Hearthstone

  describe "cards" do
    alias Deckhub.Hearthstone.Card

    @valid_attrs %{
      artist: "some artist",
      attack: 42,
      character_class: "some character_class",
      collectible: true,
      durability: 42,
      extra_text: "some extra_text",
      flavor_text: "some flavor_text",
      health: 42,
      mana: 42,
      minion_class: "some minion_class",
      name: "some name",
      quality: "some quality",
      set: "some set",
      type: "some type",
      slug: "some-name"
    }
    @update_attrs %{
      artist: "some updated artist",
      attack: 43,
      character_class: "some updated character_class",
      collectible: false,
      durability: 43,
      extra_text: "some updated extra_text",
      flavor_text: "some updated flavor_text",
      health: 43,
      mana: 43,
      minion_class: "some updated minion_class",
      name: "some updated name",
      quality: "some updated quality",
      set: "some updated set",
      type: "some updated type",
      slug: "some-updated-name"
    }
    @invalid_attrs %{
      artist: nil,
      attack: nil,
      character_class: nil,
      collectible: nil,
      durability: nil,
      extra_text: nil,
      flavor_text: nil,
      health: nil,
      mana: nil,
      minion_class: nil,
      name: nil,
      quality: nil,
      set: nil,
      type: nil,
      slug: nil
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
