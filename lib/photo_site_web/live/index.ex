defmodule PhotoSiteWeb.IndexLive do
  use PhotoSiteWeb, :live_view

  alias PhotoSite.Album
  alias PhotoSite.Repo

  def mount(_params, _session, socket) do
    album =
      Repo.get_by(Album, seq: 1)
      |> Repo.preload(:photos)

    {:ok,
     assign(socket, page_title: "justyn hunter", page_descr: album.description, album: album)}
  end

  def render(assigns) do
    ~H"""
    <.live_component module={ImageCarousel} id="photos" album={@album} />
    """
  end
end
