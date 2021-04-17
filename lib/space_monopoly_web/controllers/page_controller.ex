defmodule SpaceMonopolyWeb.PageController do
  use SpaceMonopolyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
