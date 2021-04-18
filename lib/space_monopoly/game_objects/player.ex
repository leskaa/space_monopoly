defmodule SpaceMonopoly.GameObjects.Player do
  use Ecto.Schema
  require Logger
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
    |> cast(attrs, [:score, :piece])
    |> cast_cookie
    |> validate_required([:cookie, :score, :piece])
    |> validate_player_count
    |> validate_piece_usage
  end

  def cast_cookie(changeset) do
    case changeset.data.id === nil do
      true -> cast(changeset, %{cookie: Ecto.UUID.generate()}, [:cookie])
      false -> changeset
    end
  end

  def validate_player_count(%Ecto.Changeset{} = changeset) do
    case Repo.one(from p in Player, select: count("*")) < 8 do
      true -> changeset
      false -> add_error(changeset, :score, "Too many players")
    end
  end

  def validate_piece_usage(%Ecto.Changeset{} = changeset) do
    Logger.info(changeset)

    case Repo.exists?(
           from p in Player, where: p.piece == ^(fetch_change(changeset, :piece) |> elem(1))
         ) do
      true -> add_error(changeset, :piece, "Piece already in use")
      false -> changeset
    end
  end
end
