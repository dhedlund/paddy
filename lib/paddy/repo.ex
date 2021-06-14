defmodule Paddy.Repo do
  use Ecto.Repo,
    otp_app: :paddy,
    adapter: Ecto.Adapters.Postgres
end
