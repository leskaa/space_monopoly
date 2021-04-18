defmodule SpaceMonopolyWeb.SelectLive do
  use Phoenix.LiveView
  alias SpaceMonopoly.GameObjects
  alias SpaceMonopolyWeb.Router.Helpers, as: Routes

  def mount(_params, _session, socket) do
    if connected?(socket), do: GameObjects.subscribe()

    socket =
      socket
      |> assign(:light_bulb_status, "off")
      |> assign(:on_button_status, "")
      |> assign(:off_button_status, "disabled")
      |> assign(:options, get_unused_pieces())

    {:ok, socket}
  end

  def get_unused_pieces() do
    used_pieces =
      Enum.map(GameObjects.list_players(), fn player ->
        player.piece
      end)

    Enum.filter(GameObjects.list_pieces(), fn piece ->
      !Enum.member?(used_pieces, piece.id)
    end)
  end

  def handle_info({:player_created, player}, socket) do
    {:noreply,
     update(socket, :options, fn options ->
       Enum.filter(options, fn option -> option.id != player.piece.id end)
     end)}
  end

  def handle_event("on", _value, socket) do
    socket =
      socket
      |> assign(:light_bulb_status, "on")
      |> assign(:on_button_status, "disabled")
      |> assign(:off_button_status, "")

    {:noreply, socket}
  end

  def handle_event("off", _value, socket) do
    socket =
      socket
      |> assign(:light_bulb_status, "off")
      |> assign(:on_button_status, "")
      |> assign(:off_button_status, "disabled")

    {:noreply, socket}
  end

  def handle_event("select", value, socket) do
    GameObjects.create_player(%{score: 500, piece: value["choice"]})

    {:noreply, redirect(socket, to: Routes.page_path(SpaceMonopolyWeb.Endpoint, :index))}
  end
end
