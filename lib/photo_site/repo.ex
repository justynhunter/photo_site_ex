defmodule PhotoSite.Repo do
  use Ecto.Repo,
    otp_app: :photo_site,
    adapter: Ecto.Adapters.Postgres
end
