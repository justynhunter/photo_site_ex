defmodule PhotoSiteWeb.IndexLive do
  use PhotoSiteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "justyn hunter", photo: get_photo(1, 1))}
  end

  def render(assigns) do
    ~H"""
    <div id="image_container">
      <button id="btn_prev" phx-click="prev" />
      <img src={@photo.src} alt={@photo.alt} />
      <button id="btn_next" phx-click="next" />
    </div>
    """
  end

  def handle_event("prev", _, socket) do
    {:noreply, assign(socket, :photo, get_photo(1, socket.assigns.photo.seq - 1))}
  end

  def handle_event("next", _, socket) do
    {:noreply, assign(socket, :photo, get_photo(1, socket.assigns.photo.seq + 1))}
  end

  def get_photo(album_id, seq) do
    photos = PhotoSite.Repo.all(PhotoSite.Photo, album_id: album_id)

    max_seq = Enum.max_by(photos, & &1.seq).seq
    min_seq = Enum.min_by(photos, & &1.seq).seq

    seq =
      cond do
        seq > max_seq -> 1
        seq < min_seq -> max_seq
        true -> seq
      end

    Enum.find(photos, &(&1.seq == seq))
  end
end
