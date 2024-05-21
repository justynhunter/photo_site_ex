defmodule WorksMenuComponent do
  use Phoenix.LiveComponent

  alias PhotoSite.Album
  alias PhotoSite.Repo

  def mount(socket) do
    {:ok, assign(socket, albums: Repo.all(Album), show_menu: false)}
  end

  def render(assigns) do
    ~H"""
    <div id="works_dropdown">
      <a id="menu_link" phx-click="works_click" phx-target={@myself}>work</a>
      <ul id="dropdown" class={@show_menu}>
        <%= for album <- @albums do %>
          <li><.link navigate={"/#{album.slug}"}><%= album.name %></.link></li>
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
end
