defmodule SpaceMonopoly.GameObjects.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias SpaceMonopoly.Repo
  import Ecto.Query
  alias SpaceMonopoly.GameObjects.Player

  schema "players" do
    field :cookie, :string
    field :score, :integer
    field :piece, :id

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:cookie, :score, :piece])
    |> validate_required([:cookie, :score, :piece])
    |> validate_player_count
  end

  def validate_player_count(%Ecto.Changeset{} = changeset) do
    case Repo.one(from p in Player, select: count("*")) < 8 do
      true -> changeset
      false -> add_error(changeset, :score, "Too many players")
    end
  end
end
