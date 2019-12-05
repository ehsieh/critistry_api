defmodule CritistryApiWeb.Resolvers.CritPost do
  alias CritistryApi.Crits

  def list_crit_posts(_parent, _args, _resolution) do
    {:ok, Crits.list_crit_posts()}
  end

  def get_crit_post(_, %{id: id}, _) do
    {:ok, Crits.get_crit_post!(id)}
  end
end
