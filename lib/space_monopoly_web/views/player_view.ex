defmodule SpaceMonopolyWeb.PlayerView do
  use SpaceMonopolyWeb, :view
  alias SpaceMonopolyWeb.PlayerView
  alias SpaceMonopolyWeb.PieceView
  import SpaceMonopoly.GameObjects

  def render("index.json", %{players: players}) do
    %{data: render_many(players, PlayerView, "player.json")}
  end

  def render("show.json", %{player: player}) do
    %{data: render_one(player, PlayerView, "player.json")}
  end

  def render("player.json", %{player: player}) do
    %{
      id: player.id,
      cookie: player.cookie,
      score: player.score,
      piece: render_one(get_piece!(player.piece), PieceView, "piece.json")
    }
  end
end
