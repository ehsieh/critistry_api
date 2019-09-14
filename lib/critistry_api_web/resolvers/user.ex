defmodule CritistryApiWeb.Resolvers.User do
  def list_users(_parent, _args, _resolution) do
    {:ok, [
            %{username: "Eric"}, 
            %{username: "John"}
          ]
    }
  end
end