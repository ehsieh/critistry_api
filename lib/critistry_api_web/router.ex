defmodule CritistryApiWeb.Router do
  use CritistryApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(CritistryApiWeb.Plugs.SetCurrentUser)
  end

  scope "/" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: CritistryApiWeb.Schema)

    forward("/", Absinthe.Plug, schema: CritistryApiWeb.Schema)
  end
end
