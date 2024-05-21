defmodule PhotoSiteWeb.AlbumLive do
  use PhotoSiteWeb, :live_view

  alias PhotoSite.Album
  alias PhotoSite.Repo

  def mount(params, _session, socket) do
    album = get_album(params["slug"])
    {:ok, assign(socket, page_title: album.name, album_id: album.id)}
  end

  def render(assigns) do
    ~H"""
    <.live_component module={ImageCarousel} id="images" album_id={@album_id} />
    """
  end

  def get_album(slug) do
    Repo.get_by(Album, slug: slug)
    |> Repo.preload(:photo)
  end
end
