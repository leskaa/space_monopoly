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

  describe "players" do
    alias SpaceMonopoly.GameObjects.Player

    @valid_attrs %{cookie: "some cookie", score: 42}
    @update_attrs %{cookie: "some updated cookie", score: 43}
    @invalid_attrs %{cookie: nil, score: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GameObjects.create_player()

      player
    end

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert GameObjects.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert GameObjects.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = GameObjects.create_player(@valid_attrs)
      assert player.cookie == "some cookie"
      assert player.score == 42
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GameObjects.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, %Player{} = player} = GameObjects.update_player(player, @update_attrs)
      assert player.cookie == "some updated cookie"
      assert player.score == 43
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = GameObjects.update_player(player, @invalid_attrs)
      assert player == GameObjects.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = GameObjects.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> GameObjects.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = GameObjects.change_player(player)
    end
  end
end
