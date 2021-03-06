defmodule CritistryApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:password, :string)
    field(:password_hash, :string)
    field(:username, :string)
    field(:avatar, :string)
    field(:bio, :string)

    has_many(:crit_requests, CritistryApi.Crits.CritRequest)
    has_many(:crit_posts, CritistryApi.Crits.CritPost)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    required_fields = [:username, :email, :password, :avatar]
    IO.inspect attrs

    user
    |> cast(attrs, required_fields)
    |> validate_required(required_fields)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_length(:username, min: 5)
    |> validate_length(:password, min: 8)
    |> hash_password()
    |> IO.inspect
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
