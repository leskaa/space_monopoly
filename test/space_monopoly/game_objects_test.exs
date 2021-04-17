defmodule SpaceMonopoly.GameObjectsTest do
  use SpaceMonopoly.DataCase

  alias SpaceMonopoly.GameObjects

  describe "pieces" do
    alias SpaceMonopoly.GameObjects.Piece

    @valid_attrs %{lat: "120.5", lon: "120.5", name: "some name", url: "some url"}
    @update_attrs %{lat: "456.7", lon: "456.7", name: "some updated name", url: "some updated url"}
    @invalid_attrs %{lat: nil, lon: nil, name: nil, url: nil}

    def piece_fixture(attrs \\ %{}) do
      {:ok, piece} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GameObjects.create_piece()

      piece
    end

    test "list_pieces/0 returns all pieces" do
      piece = piece_fixture()
      assert GameObjects.list_pieces() == [piece]
    end

    test "get_piece!/1 returns the piece with given id" do
      piece = piece_fixture()
      assert GameObjects.get_piece!(piece.id) == piece
    end

    test "create_piece/1 with valid data creates a piece" do
      assert {:ok, %Piece{} = piece} = GameObjects.create_piece(@valid_attrs)
      assert piece.lat == Decimal.new("120.5")
      assert piece.lon == Decimal.new("120.5")
      assert piece.name == "some name"
      assert piece.url == "some url"
    end

    test "create_piece/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameObjects.create_piece(@invalid_attrs)
    end

    test "update_piece/2 with valid data updates the piece" do
      piece = piece_fixture()
      assert {:ok, %Piece{} = piece} = GameObjects.update_piece(piece, @update_attrs)
      assert piece.lat == Decimal.new("456.7")
      assert piece.lon == Decimal.new("456.7")
      assert piece.name == "some updated name"
      assert piece.url == "some updated url"
    end

    test "update_piece/2 with invalid data returns error changeset" do
      piece = piece_fixture()
      assert {:error, %Ecto.Changeset{}} = GameObjects.update_piece(piece, @invalid_attrs)
      assert piece == GameObjects.get_piece!(piece.id)
    end

    test "delete_piece/1 deletes the piece" do
      piece = piece_fixture()
      assert {:ok, %Piece{}} = GameObjects.delete_piece(piece)
      assert_raise Ecto.NoResultsError, fn -> GameObjects.get_piece!(piece.id) end
    end

    test "change_piece/1 returns a piece changeset" do
      piece = piece_fixture()
      assert %Ecto.Changeset{} = GameObjects.change_piece(piece)
    end
  end
end
