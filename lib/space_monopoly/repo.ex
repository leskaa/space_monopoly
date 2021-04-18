defmodule SpaceMonopoly.Repo do
  use Ecto.Repo,
    otp_app: :space_monopoly,
    adapter: Ecto.Adapters.Postgres
end
