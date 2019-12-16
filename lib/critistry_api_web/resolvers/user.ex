defmodule CritistryApiWeb.Resolvers.User do
  alias CritistryApi.Accounts
  alias CritistryApiWeb.Schema.ChangesetErrors

  def list_users(_parent, _args, _resolution) do
    {:ok, Accounts.list_users()}
  end

  def signup(_, args, _) do
    args |> IO.inspect
    case Accounts.create_user(args) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create user", details: ChangesetErrors.error_details(changeset)
        }

      {:ok, user} ->
        token = CritistryApiWeb.AuthToken.sign(user)
        {:ok, %{user: user, token: token}}
    end
  end

  def signin(_, %{username: username, password: password}, _) do
    case Accounts.authenticate(username, password) do
      {:error, field, reason} ->
        {
          :error,
          field: field, message: reason
        }

      {:ok, user} ->
        token = CritistryApiWeb.AuthToken.sign(user)
        {:ok, %{user: user, token: token}}
    end
  end

  def me(_, _, %{context: %{current_user: user}}) do
    {:ok, user}
  end

  def me(_, _, _) do
    {:ok, nil}
  end
end
