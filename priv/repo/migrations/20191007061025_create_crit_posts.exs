defmodule CritistryApi.Repo.Migrations.CreateCritPosts do
  use Ecto.Migration

  def change do
    create table(:crit_posts) do
      add :post_text, :text
      add :crit_request_id, references(:crit_requests, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:crit_posts, [:crit_request_id])
    create index(:crit_posts, [:user_id])
  end
end
