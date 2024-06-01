defmodule PhotoSite.Album do
  use Ecto.Schema

  schema "album" do
    field :name, :string
    field :slug, :string
    field :seq, :integer
    field :description, :string
    field :is_visible, :boolean
    field :created_at, :utc_datetime
    has_many :photos, PhotoSite.Photo
  end
end
