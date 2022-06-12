defmodule Gfinancer.Repo do
  use Ecto.Repo,
    otp_app: :gfinancer,
    adapter: Ecto.Adapters.Postgres
end
