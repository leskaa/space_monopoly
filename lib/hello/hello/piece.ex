defmodule Hello.Hello.Piece do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pieces" do
    field :lat, :decimal
    field :lon, :decimal
    field :name, :string
    field :starting_money, :decimal
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(piece, attrs) do
    piece
    |> cast(attrs, [:name, :url, :lat, :lon, :starting_money])
    |> validate_required([:name, :url, :lat, :lon, :starting_money])
  end
end
