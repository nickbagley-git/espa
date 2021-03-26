defmodule EventApp.Repo.Migrations.CreateInvites do
  use Ecto.Migration

  def change do
    create table(:invites) do
      add :name, :string, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :event_id, references(:events, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:invites, [:user_id])
    create index(:invites, [:event_id])
  end
end
