defmodule PhotoSiteWeb.IndexLive do
  use PhotoSiteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "justyn hunter", album_id: 1)}
  end

  def render(assigns) do
    ~H"""
    <.live_component module={ImageCarousel} id="photos" album_id={@album_id} />
    """
  end
end
