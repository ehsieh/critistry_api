defmodule CritistryApiWeb.Resolvers.CritRequest do
  alias CritistryApi.Crits
  alias CritistryApiWeb.Schema.ChangesetErrors

  def list_crit_requests(_, _, _) do
    {:ok, Crits.list_crit_requests()}
  end

  def get_crit_request(_, %{id: id}, _) do
    {:ok, Crits.get_crit_request!(id)}
  end

  def create_crit_request(_, args, %{context: %{current_user: user}}) do    
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
