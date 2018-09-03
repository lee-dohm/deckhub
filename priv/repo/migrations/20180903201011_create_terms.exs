defmodule Deckhub.Repo.Migrations.CreateTerms do
  use Ecto.Migration

  def change do
    create table(:terms) do
      add :key, :string
      add :value, :text

      timestamps()
    end

  end
end
