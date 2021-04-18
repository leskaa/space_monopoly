defmodule SpaceMonopolyWeb.SatellitesLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:satellites, Satellite.SatelliteDatabase.list())

    {:ok, socket}
  end
end
