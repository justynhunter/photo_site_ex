defmodule PhotoSiteWeb.ContactLive do
  use PhotoSiteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: %{"user_name" => "", "message" => ""})}
  end

  def render(assigns) do
    ~H"""
    <div id="form_container">
      <.form for={@form} phx-submit="save" phx-target{@myself}>
        <.input type="text" name="user_name" label="name" value="" field={@form["user_name"]} />
        <.input type="textarea" name="message" label="message" value="" field={@form["message"]} />
        <button>send</button>
      </.form>
    </div>
    """
  end

  def handle_event("save", params, socket) do
    IO.puts("hello")
    IO.inspect(socket.assigns)
    IO.inspect(params)
    IO.inspect(params["user_name"])
    IO.inspect(params["message"])
    {:noreply, socket}
  end
end
