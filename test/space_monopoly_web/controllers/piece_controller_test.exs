defmodule SpaceMonopolyWeb.PieceControllerTest do
  use SpaceMonopolyWeb.ConnCase

  alias SpaceMonopoly.GameObjects
  alias SpaceMonopoly.GameObjects.Piece

  @create_attrs %{
    lat: "120.5",
    lon: "120.5",
    name: "some name",
    url: "some url"
  }
  @update_attrs %{
    lat: "456.7",
    lon: "456.7",
    name: "some updated name",
    url: "some updated url"
  }
  @invalid_attrs %{lat: nil, lon: nil, name: nil, url: nil}

  def fixture(:piece) do
    {:ok, piece} = GameObjects.create_piece(@create_attrs)
    piece
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pieces", %{conn: conn} do
      conn = get(conn, Routes.piece_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create piece" do
    test "renders piece when data is valid", %{conn: conn} do
      conn = post(conn, Routes.piece_path(conn, :create), piece: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.piece_path(conn, :show, id))

      assert %{
               "id" => id,
               "lat" => "120.5",
               "lon" => "120.5",
               "name" => "some name",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.piece_path(conn, :create), piece: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update piece" do
    setup [:create_piece]

    test "renders piece when data is valid", %{conn: conn, piece: %Piece{id: id} = piece} do
      conn = put(conn, Routes.piece_path(conn, :update, piece), piece: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.piece_path(conn, :show, id))

      assert %{
               "id" => id,
               "lat" => "456.7",
               "lon" => "456.7",
               "name" => "some updated name",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, piece: piece} do
      conn = put(conn, Routes.piece_path(conn, :update, piece), piece: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete piece" do
    setup [:create_piece]

    test "deletes chosen piece", %{conn: conn, piece: piece} do
      conn = delete(conn, Routes.piece_path(conn, :delete, piece))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.piece_path(conn, :show, piece))
      end
    end
  end

  defp create_piece(_) do
    piece = fixture(:piece)
    %{piece: piece}
  end
end
