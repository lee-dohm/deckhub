defmodule Deckhub.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name, :string, null: false
      add :type, :string, null: false
      add :character_class, :string, null: false
      add :set, :string, null: false
      add :quality, :string, null: false
      add :mana, :integer
      add :attack, :integer
      add :health, :integer
      add :durability, :integer
      add :minion_class, :string
      add :extra_text, :string
      add :flavor_text, :string
      add :artist, :string
      add :collectible, :boolean, default: false, null: false
      add :slug, :string, null: false

      timestamps()
    end

    create unique_index(:cards, [:slug])
  end
end
