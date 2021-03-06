defmodule CritistryApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :avatar, :string
      add :email, :string
      add :password, :string
      add :password_hash, :string
      add :bio, :text

      timestamps()
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end
