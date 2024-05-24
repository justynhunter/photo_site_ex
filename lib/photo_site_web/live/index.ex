defmodule PhotoSiteWeb.IndexLive do
  use PhotoSiteWeb, :live_view

  alias PhotoSite.Album
  alias PhotoSite.Repo

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "justyn hunter", album: get_album("selected-places"))}
  end

  def render(assigns) do
    ~H"""
    <.live_component module={ImageCarousel} id="photos" album={@album} />
    """
  end

  def get_album(slug) do
    Repo.get_by(Album, slug: slug)
    |> Repo.preload(:photo)
  end
end
