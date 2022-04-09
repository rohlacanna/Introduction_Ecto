defmodule Ecto4noobs.Repo do
  use Ecto.Repo,
    otp_app: :ecto4noobs,
    adapter: Ecto.Adapters.Postgres
end
