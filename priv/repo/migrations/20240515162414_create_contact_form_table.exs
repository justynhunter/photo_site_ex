defmodule PhotoSite.Repo.Migrations.CreateContactFormTable do
  use Ecto.Migration

  def change do
    create table(:contact_form) do
      add :name, :string, null: false
      add :message, :string, null: false
      add :created_at, :utc_datetime, default: fragment("NOW()")
    end
  end
end
