defmodule PhotoSite.Album do
  use Ecto.Schema

  schema "album" do
    field :name, :string
    field :description, :string
    field :is_visible, :boolean
    field :created_at, :utc_datetime
    has_many :photo, PhotoSite.Photo
  end
end
