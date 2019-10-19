defmodule CritistryApiWeb.Resolvers.User do
  alias CritistryApi.Accounts

  def list_users(_parent, _args, _resolution) do
    {:ok, Accounts.list_users}
  end
end
