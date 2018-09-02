defmodule Deckhub.Repo.Migrations.AddSmallImageToCards do
  use Ecto.Migration

  def change do
    alter table(:cards) do
      add :small_image, :string
    end
  end
end
