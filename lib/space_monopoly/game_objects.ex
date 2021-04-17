defmodule SpaceMonopoly.GameObjects do
  @moduledoc """
  The GameObjects context.
  """

  import Ecto.Query, warn: false
  alias SpaceMonopoly.Repo

  alias SpaceMonopoly.GameObjects.Piece

  @doc """
  Returns the list of pieces.

  ## Examples

      iex> list_pieces()
      [%Piece{}, ...]

  """
  def list_pieces do
    Repo.all(Piece)
  end

  @doc """
  Gets a single piece.

  Raises `Ecto.NoResultsError` if the Piece does not exist.

  ## Examples

      iex> get_piece!(123)
      %Piece{}

      iex> get_piece!(456)
      ** (Ecto.NoResultsError)

  """
  def get_piece!(id), do: Repo.get!(Piece, id)

  @doc """
  Creates a piece.

  ## Examples

      iex> create_piece(%{field: value})
      {:ok, %Piece{}}

      iex> create_piece(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_piece(attrs \\ %{}) do
    %Piece{}
    |> Piece.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a piece.

  ## Examples

      iex> update_piece(piece, %{field: new_value})
      {:ok, %Piece{}}

      iex> update_piece(piece, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_piece(%Piece{} = piece, attrs) do
    piece
    |> Piece.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a piece.

  ## Examples

      iex> delete_piece(piece)
      {:ok, %Piece{}}

      iex> delete_piece(piece)
      {:error, %Ecto.Changeset{}}

  """
  def delete_piece(%Piece{} = piece) do
    Repo.delete(piece)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking piece changes.

  ## Examples

      iex> change_piece(piece)
      %Ecto.Changeset{data: %Piece{}}

  """
  def change_piece(%Piece{} = piece, attrs \\ %{}) do
    Piece.changeset(piece, attrs)
  end

  alias SpaceMonopoly.GameObjects.Player

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Player{}, ...]

  """
  def list_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{data: %Player{}}

  """
  def change_player(%Player{} = player, attrs \\ %{}) do
    Player.changeset(player, attrs)
  end
end
