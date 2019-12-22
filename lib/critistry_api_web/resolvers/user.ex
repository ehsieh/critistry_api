defmodule CritistryApiWeb.Resolvers.User do
  alias CritistryApi.Accounts
  alias CritistryApiWeb.Schema.ChangesetErrors

  def list_users(_parent, _args, _resolution) do
    {:ok, Accounts.list_users()}
  end

  def default_avatars(_, _, _) do
    image_url = "#{CritistryApiWeb.Endpoint.url()}/images/avatars"
    {:ok, [          
      "#{image_url}/avatar-0.png",
      "#{image_url}/avatar-23.png",
      "#{image_url}/avatar-26.png",
      "#{image_url}/avatar-28.png",
      "#{image_url}/avatar-70.png",
      "#{image_url}/avatar-48.png"
    ]}
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
