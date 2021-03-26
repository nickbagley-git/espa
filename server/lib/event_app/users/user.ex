defmodule EventApp.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string

    has_many :events, EventApp.Events.Event
    has_many :comments, EventApp.Comments.Comment
    has_many :invites, EventApp.Invites.Invite
    has_many :responses, EventApp.Responses.Response

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    password = attrs["password"]
    user
    |> cast(attrs, [:name, :email])
    |> add_password_hash(attrs["password"])
    |> validate_required([:name, :email, :password_hash])
  end

  def add_password_hash(cset, nil) do
    cset
  end

  def add_password_hash(cset, password) do
    change(cset, Argon2.add_hash(password))
  end



end
