defmodule EventApp.Invites.Invite do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invites" do
    field :name, :string
    belongs_to :user, EventApp.Users.User
    belongs_to :event, EventApp.Events.Event

    timestamps()
  end

  @doc false
  def changeset(invite, attrs) do
    invite
    |> cast(attrs, [:name, :user_id, :event_id])
    |> validate_required([:name, :user_id, :event_id])
  end
end
