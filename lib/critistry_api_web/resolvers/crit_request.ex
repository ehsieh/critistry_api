defmodule CritistryApiWeb.Resolvers.CritRequest do
    alias CritistryApi.Crits

    def list_crit_requests(_parent, _args, _resolution) do
        {:ok, Crits.list_crit_requests}
    end
end