defmodule HelloWeb.SelectController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "select.html")
  end
end
