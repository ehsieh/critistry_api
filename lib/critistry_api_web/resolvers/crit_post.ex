defmodule CritistryApiWeb.Resolvers.CritPost do
  alias CritistryApi.Crits
  alias CritistryApiWeb.Schema.ChangesetErrors

  def list_crit_posts(_parent, _args, _resolution) do
    {:ok, Crits.list_crit_posts()}
  end

  def get_crit_post(_, %{id: id}, _) do
    {:ok, Crits.get_crit_post!(id)}
  end

  def create_crit_post(_, args, %{context: %{current_user: user}}) do    
    IO.puts "create_crit_post resolver"
    case Crits.create_crit_post(user, args) do
      {:error, changeset} ->
        {
          :error,
          message: "Could not create new crit post",
          details: ChangesetErrors.error_details(changeset)
        }

      {:ok, crit_post} ->
        {:ok, crit_post}
    end
  end
end
