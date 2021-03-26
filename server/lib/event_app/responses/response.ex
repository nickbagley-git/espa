defmodule EventApp.Responses.Response do
  use Ecto.Schema
  import Ecto.Changeset

  schema "responses" do
    field :body, :string
    belongs_to :user, EventApp.Users.User
    belongs_to :event, EventApp.Events.Event

    timestamps()
  end

  @doc false
  def changeset(response, attrs) do
    response
    |> cast(attrs, [:body, :user_id, :event_id])
    |> validate_required([:body, :user_id, :event_id])
  end
end
