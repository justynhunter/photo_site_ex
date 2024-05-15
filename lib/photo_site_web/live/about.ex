defmodule PhotoSiteWeb.AboutLive do
  use PhotoSiteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :about, %{})}
  end

  def render(assigns) do
    ~H"""
    <div id="cv">
      <p>
        Justyn Hunter lives in Nashville, TN and documents the America south with an emphasis an human inhabited space,
        the past and religious iconography.
      </p>

      <p>
        other work may be found at the <a href="https://collective.photos">"some photographers"</a>
        collective.
      </p>

      <h3>published</h3>
      <ul>
        <li>
          <em>Investigations in Infrastructure</em>, Subjectively Objective, Rochester Hills, MI, 2022
        </li>
        <li>
          <em>Everything is Narrative</em>, Subjectively Objective, Rochester Hills, MI, 2022
        </li>
        <li>
          <em>Slow Exposures 2024</em>, Georgia (jurors: Alexa Dilworth, Aline Smithson)
        </li>
      </ul>
    </div>
    """
  end
end
