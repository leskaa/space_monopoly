defmodule SpaceMonopoly.GameObjects.Piece do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pieces" do
    field :lat, :decimal
    field :lon, :decimal
    field :name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(piece, attrs) do
    piece
    |> cast(attrs, [:url, :name, :lat, :lon])
    |> validate_required([:url, :name, :lat, :lon])
  end
end
