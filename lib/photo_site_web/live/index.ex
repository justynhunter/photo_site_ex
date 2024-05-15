defmodule PhotoSiteWeb.IndexLive do
  use PhotoSiteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :photo, get_photo(1))}
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
    new_photo =
      socket.assigns.photo.id
      |> prev_id()
      |> get_photo()

    {:noreply, assign(socket, :photo, new_photo)}
  end

  def handle_event("next", _, socket) do
    new_photo =
      socket.assigns.photo.id
      |> next_id()
      |> get_photo()

    {:noreply, assign(socket, :photo, new_photo)}
  end

  def next_id(id) when id == 3, do: 1
  def next_id(id), do: id + 1

  def prev_id(id) when id == 1, do: 3
  def prev_id(id), do: id - 1

  def get_photo(id) do
    photos = [
      %{
        id: 1,
        src: "https://live.staticflickr.com/65535/53609244371_184f1a88c1_b.jpg",
        alt: "rotting house"
      },
      %{
        id: 2,
        src: "https://live.staticflickr.com/65535/53684852131_5d1a0c2a54_b.jpg",
        alt: "chimney"
      },
      %{
        id: 3,
        src: "https://live.staticflickr.com/65535/53684851241_bac2ceb36b_b.jpg",
        alt: "rotting house"
      }
    ]

    Enum.find(photos, &(&1.id == id))
  end
end
