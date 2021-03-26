defmodule EventAppWeb.EventView do
  use EventAppWeb, :view
  alias EventAppWeb.EventView
  alias EventAppWeb.UserView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    user = if Ecto.assoc_loaded?(event.user) do
      render_one(event.user, UserView, "user.json")
    else
      nil
    end
    %{id: event.id,
      name: event.name,
      date: event.date,
      description: event.description,
      user: user
    }
  end
end
