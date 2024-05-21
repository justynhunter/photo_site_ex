defmodule WorksMenuComponent do
  use Phoenix.LiveComponent

  alias PhotoSite.Album, as: Album
  alias PhotoSite.Repo, as: Repo

  def mount(socket) do
    albums = get_albums()
    {:ok, assign(socket, albums: albums, show_menu: false)}
  end

  def render(assigns) do
    ~H"""
    <div id="works_dropdown">
      <a id="menu_link" phx-click="works_click" phx-target={@myself}>work</a>
      <ul id="dropdown" class={@show_menu}>
        <%= for album <- @albums do %>
          <li><a href={"/album/#{album.id}"}><%= album.name %></a></li>
        <% end %>
      </ul>
    </div>
    """
  end

  def handle_event("works_click", _params, socket) do
    socket =
      case socket.assigns.show_menu == "show" do
        true -> assign(socket, show_menu: "")
        false -> assign(socket, show_menu: "show")
      end

    {:noreply, socket}
  end

  def get_albums() do
    Repo.all(Album)
  end
end
