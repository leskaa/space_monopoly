defmodule SpaceMonopolyWeb.PieceController do
  use SpaceMonopolyWeb, :controller

  alias SpaceMonopoly.GameObjects
  alias SpaceMonopoly.GameObjects.Piece

  action_fallback SpaceMonopolyWeb.FallbackController

  def index(conn, _params) do
    pieces = GameObjects.list_pieces()
    render(conn, "index.json", pieces: pieces)
  end

  def create(conn, %{"piece" => piece_params}) do
    with {:ok, %Piece{} = piece} <- GameObjects.create_piece(piece_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.piece_path(conn, :show, piece))
      |> render("show.json", piece: piece)
    end
  end

  def show(conn, %{"id" => id}) do
    piece = GameObjects.get_piece!(id)
    render(conn, "show.json", piece: piece)
  end

  def update(conn, %{"id" => id, "piece" => piece_params}) do
    piece = GameObjects.get_piece!(id)

    with {:ok, %Piece{} = piece} <- GameObjects.update_piece(piece, piece_params) do
      render(conn, "show.json", piece: piece)
    end
  end

  def delete(conn, %{"id" => id}) do
    piece = GameObjects.get_piece!(id)

    with {:ok, %Piece{}} <- GameObjects.delete_piece(piece) do
      send_resp(conn, :no_content, "")
    end
  end
end
