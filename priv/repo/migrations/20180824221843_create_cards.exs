defmodule Deckhub.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :armor, :integer
      add :artist, :string
      add :attack, :integer
      add :card_class, :string, null: false
      add :card_id, :string, null: false
      add :collectible, :boolean, null: false, default: false
      add :cost, :integer
      add :dbf_id, :integer, null: false
      add :durability, :integer
      add :elite, :boolean, null: false, default: false
      add :flavor, :string
      add :health, :integer
      add :image, :string, null: false
      add :name, :string, null: false
      add :race, :string
      add :rarity, :string, null: false
      add :set, :string, null: false
      add :slug_name, :string, null: false
      add :text, :string
      add :type, :string, null: false

      timestamps()
    end

    create unique_index(:cards, [:slug_name])
    create unique_index(:cards, [:card_id])
    create unique_index(:cards, [:dbf_id])
  end
end
