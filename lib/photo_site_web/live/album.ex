defmodule PhotoSiteWeb.AlbumLive do
  use PhotoSiteWeb, :live_view

  alias PhotoSite.Repo, as: Repo
  alias PhotoSite.Album, as: Album

  def mount(params, _session, socket) do
    album = get_album(params["id"])
    {:ok, assign(socket, page_title: album.name, show: 1, photos: album.photo)}
  end

  def render(assigns) do
    ~H"""
    <div id="image_container">
      <button id="btn_prev" phx-click="prev" />
      <%= for photo <- @photos do %>
        <img src={photo.src} alt={photo.alt} class={show_photo(@show, photo)} />
      <% end %>
      <button id="btn_next" phx-click="next" />
    </div>
    """
  end

  def handle_event("prev", _, socket) do
    {:noreply, assign(socket, show: get_next_seq(socket.assigns.show - 1, socket.assigns.photos))}
  end

  def handle_event("next", _, socket) do
    {:noreply, assign(socket, show: get_next_seq(socket.assigns.show + 1, socket.assigns.photos))}
  end

  defp show_photo(seq, photo) do
    case seq == photo.seq do
      true -> "fade_in"
      false -> "hide"
    end
  end

  @spec get_album(integer()) :: Album
  def get_album(album_id) do
    Repo.get(Album, album_id)
    |> Repo.preload(:photo)
  end

  defp get_next_seq(curr, photos) do
    max_seq = Enum.max_by(photos, & &1.seq).seq
    min_seq = Enum.min_by(photos, & &1.seq).seq

    case curr do
      n when n > max_seq -> 1
      n when n < min_seq -> max_seq
      n -> n
    end
  end
end

