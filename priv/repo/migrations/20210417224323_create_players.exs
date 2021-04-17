defmodule SpaceMonopoly.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :cookie, :string
      add :score, :integer
      add :piece, references(:pieces, on_delete: :nothing)

      timestamps()
    end

    create index(:players, [:piece])
  end
end
