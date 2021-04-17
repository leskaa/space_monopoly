defmodule SpaceMonopoly.GameObjects.Player do
  use Ecto.Schema
  import Ecto.Changeset
  # alias SpaceMonopoly.Repo
  # import Ecto.Query

  schema "players" do
    field :cookie, :string
    field :score, :integer
    field :piece, :id

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    # Repo.one(from p in Player, select: count("*"))
    player
    |> cast(attrs, [:cookie, :score])
    |> validate_required([:cookie, :score])
    # |> validate_length(count, max: 8)
  end
end
