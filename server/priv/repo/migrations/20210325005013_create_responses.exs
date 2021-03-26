defmodule EventApp.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :body, :string, null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :event_id, references(:events, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:responses, [:user_id])
    create index(:responses, [:event_id])
  end
end
