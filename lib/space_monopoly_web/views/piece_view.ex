defmodule SpaceMonopolyWeb.PieceView do
  use SpaceMonopolyWeb, :view
  alias SpaceMonopolyWeb.PieceView

  def render("index.json", %{pieces: pieces}) do
    %{data: render_many(pieces, PieceView, "piece.json")}
  end

  def render("show.json", %{piece: piece}) do
    %{data: render_one(piece, PieceView, "piece.json")}
  end

  def render("piece.json", %{piece: piece}) do
    %{id: piece.id,
      url: piece.url,
      name: piece.name,
      lat: piece.lat,
      lon: piece.lon}
  end
end
