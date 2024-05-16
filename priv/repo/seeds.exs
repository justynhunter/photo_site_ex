# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhotoSite.Repo.insert!(%PhotoSite.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhotoSite.Repo
alias PhotoSite.Album
alias PhotoSite.Photo

unless Repo.exists?(Album, name: "default") do
  default_album = %Album{name: "default", description: "default album for home page"}

  {_, default_album} = Repo.insert(default_album)

  photo1 = %Photo{album_id: default_album.id, seq: 1, src: "https://live.staticflickr.com/65535/53684851241_bac2ceb36b_b.jpg", alt: "rotting house"}
  photo2 = %Photo{album_id: default_album.id, seq: 2, src: "https://live.staticflickr.com/65535/53684852131_5d1a0c2a54_b.jpg", alt: "chimney"}
  photo3 = %Photo{album_id: default_album.id, seq: 3, src: "https://live.staticflickr.com/65535/53609244371_184f1a88c1_b.jpg", alt: "rotting house"}

  Repo.insert(photo1)
  Repo.insert(photo2)
  Repo.insert(photo3)
end

