defmodule CritistryApiWeb.Resolvers.CritPost do
    alias CritistryApi.Crits
    
    def list_crit_posts(_parent, _args, _resolution) do
        {:ok, Crits.list_crit_posts}
    end
end