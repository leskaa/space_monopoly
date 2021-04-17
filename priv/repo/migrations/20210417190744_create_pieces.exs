defmodule Hello.Repo.Migrations.CreatePieces do
  use Ecto.Migration

  def change do
    create table(:pieces) do
      add :name, :string
      add :url, :string
      add :lat, :decimal, precision: 16
      add :lon, :decimal, precision: 16
      # add :starting_money, :decimal, precision: 2
      timestamps()
    end
  end
end
