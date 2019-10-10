defmodule CritistryApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :password, :string
    field :password_hash, :string
    field :username, :string

    has_many :crit_requests, CritistryApi.Crits.CritRequest
    has_many :crit_posts, CritistryApi.Crits.CritPost

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :password_hash])
    |> validate_required([:username, :email, :password, :password_hash])
  end
end
