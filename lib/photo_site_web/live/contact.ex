defmodule PhotoSiteWeb.ContactLive do
  use PhotoSiteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       page_title: "contact",
       show_form: true,
       form: %{"user_name" => "", "message" => ""}
     )}
  end

  def render(assigns) do
    ~H"""
    <%= if @show_form do %>
      <div id="form_container">
        <.form for={@form} phx-submit="save" phx-target{@myself}>
          <.input type="text" name="user_name" label="name" value="" field={@form["user_name"]} />
          <.input type="textarea" name="message" label="message" value="" field={@form["message"]} />
          <button>send</button>
        </.form>
      </div>
    <% else %>
      <div>
        <p>thank you for your message.</p>
      </div>
    <% end %>
    """
  end

  def handle_event("save", params, socket) do
    contact_form = %PhotoSite.ContactForm{name: params["user_name"], message: params["message"]}
    PhotoSite.Repo.insert(contact_form)
    {:noreply, assign(socket, show_form: false)}
  end
end
