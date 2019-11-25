defmodule CritistryApiWeb.Resolvers.CritRequest do
  alias CritistryApi.Crits
  alias CritistryApiWeb.Schema.ChangesetErrors

  def list_crit_requests(_parent, _args, _resolution) do
    {:ok, Crits.list_crit_requests()}
  end

  def create_crit_request(_, args, %{context: %{current_user: user}}) do
    IO.inspect(user)
    IO.inspect(args)
    case Crits.create_crit_request(user, args) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create new crit request",
          details: ChangesetErrors.error_details(changeset)
        }
      {:ok, crit_request} ->
        {:ok, crit_request}
    end
  end
end
