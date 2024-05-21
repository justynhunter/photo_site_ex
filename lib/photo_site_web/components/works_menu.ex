defmodule WorksMenuComponent do
  use Phoenix.LiveComponent

  alias PhotoSite.Album, as: Album
  alias PhotoSite.Repo, as: Repo

  def mount(socket) do
    albums = get_albums()
    {:ok, assign(socket, albums: albums)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <script>
        function worksClick() {
            document.getElementById("dropdown").classList.add("show");
        }
      </script>
      <a onclick="worksClick()" id="menu_link">work</a>
      <ul id="dropdown">
        <%= for album <- @albums do %>
          <li><a href={"/album/#{album.id}"}><%= album.name %></a></li>
        <% end %>
      </ul>
    </div>
    """
  end

  def get_albums() do
    Repo.all(Album)
  end
end
