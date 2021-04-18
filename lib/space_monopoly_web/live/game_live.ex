defmodule SpaceMonopolyWeb.GameLive do
  use Phoenix.LiveView
  import PhoenixLiveReact

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:idk, "on")

    {:ok, socket}
  end
end
