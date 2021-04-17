defmodule SpaceMonopolyWeb.PageController do
  use SpaceMonopolyWeb, :controller

  def index(conn, _params) do
    render(conn, "select.html")
  end
end
