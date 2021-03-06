defmodule SpaceMonopolyWeb.Router do
  use SpaceMonopolyWeb, :router

  pipeline :browser do
    plug :put_root_layout, {SpaceMonopolyWeb.LayoutView, :root}
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SpaceMonopolyWeb do
    pipe_through :browser

    live "/selectlive", SelectLive, :index
    live "/satellites", SatellitesLive, :index
    live "/game", GameLive, :index

    get "/", PageController, :index
    get "/select", SelectController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", SpaceMonopolyWeb do
    pipe_through :api

    # Pieces Json API
    get "/pieces", PieceController, :index
    get "/pieces/:id", PieceController, :show

    # Players Json API
    resources "/players", PlayerController, except: [:delete]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SpaceMonopolyWeb.Telemetry
    end
  end
end
