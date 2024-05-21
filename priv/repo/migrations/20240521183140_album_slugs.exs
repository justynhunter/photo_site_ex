defmodule PhotoSite.Repo.Migrations.AlbumSlugs do
  use Ecto.Migration

  def change do
    alter table(:album) do
      add :slug, :string
    end
  end
end
