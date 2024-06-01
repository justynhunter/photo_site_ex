defmodule ImageCarousel do
  use Phoenix.LiveComponent

  def mount(socket) do
    {:ok, assign(socket, page_title: "justyn hunter", show: 1, photos: %{})}
  end

  def update(assigns, socket) do
    photos = assigns.album.photos
    {:ok, assign(socket, show: 1, photos: photos)}
  end

  def render(assigns) do
    ~H"""
    <div class="image_carousel">
      <button id="btn_prev" aria-label="previous photo" phx-click="prev" phx-target={@myself} />
      <%= for photo <- @photos do %>
        <img
          loading={
            if photo.seq == 1 do
              "eager"
            else
              "lazy"
            end
          }
          src={photo.src}
          alt={photo.alt}
          class={show_photo(@show, photo)}
        />
      <% end %>
      <button id="btn_next" aria-label="next photo" phx-click="next" phx-target={@myself} />
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

  defp get_next_seq(curr, photos) do
    {min_seq, max_seq} =
      photos
      |> Enum.min_max_by(& &1.seq)
      |> (fn {min, max} -> {min.seq, max.seq} end).()

    case curr do
      n when n > max_seq -> 1
      n when n < min_seq -> max_seq
      n -> n
    end
  end
end
