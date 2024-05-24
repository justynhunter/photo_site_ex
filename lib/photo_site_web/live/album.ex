defmodule PhotoSiteWeb.AlbumLive do
  use PhotoSiteWeb, :live_view

  alias PhotoSite.Album
  alias PhotoSite.Repo

  def mount(params, _session, socket) do
    album = get_album(params["slug"])
    {:ok, assign(socket, page_title: album.name, page_descr: album.description, album: album)}
  end

  def render(assigns) do
    ~H"""
    <h2><%= @album.name %></h2>
    <p><%= @album.description %></p>
    <.live_component module={ImageCarousel} id="images" album={@album} />
    """
  end

  def get_album(slug) do
    Repo.get_by!(Album, slug: slug)
    |> Repo.preload(:photo)
  end
end
