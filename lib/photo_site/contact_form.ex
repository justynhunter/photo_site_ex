defmodule PhotoSite.ContactForm do
  use Ecto.Schema

  schema "contact_form" do
    field :name, :string
    field :message, :string
    field :created_at, :utc_datetime
  end
end
