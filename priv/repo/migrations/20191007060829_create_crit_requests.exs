defmodule CritistryApi.Repo.Migrations.CreateCritRequests do
  use Ecto.Migration

  def change do
    create table(:crit_requests) do
      add :title, :string
      add :description, :string
      add :image, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:crit_requests, [:user_id])
  end
end
