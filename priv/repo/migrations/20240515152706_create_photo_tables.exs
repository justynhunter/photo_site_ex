defmodule PhotoSite.Repo.Migrations.CreatePhotoTables do
  use Ecto.Migration

  def change do
    create table(:album) do
      add :name, :string, null: false
      add :description, :string
      add :is_visible, :boolean, default: true
      add :created_at, :utc_datetime, default: fragment("NOW()")
    end

    create table(:photo) do
      add :album_id, references(:album)
      add :seq, :integer, null: false
      add :src, :string, null: false
      add :alt, :string, null: false
      add :created_at, :utc_datetime, default: fragment("NOW()")
    end
  end
end
