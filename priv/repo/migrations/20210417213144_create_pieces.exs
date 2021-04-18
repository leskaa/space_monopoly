defmodule SpaceMonopoly.Repo.Migrations.CreatePieces do
  use Ecto.Migration

  def change do
    create table(:pieces) do
      add :url, :string
      add :name, :string
      add :lat, :decimal
      add :lon, :decimal

      timestamps()
    end

  end
end
