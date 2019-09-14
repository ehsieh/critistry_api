defmodule CritistryApiWeb.Router do
  use CritistryApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  
  scope "/" do
    pipe_through :api    

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: CritistryApiWeb.Schema

    forward "/", Absinthe.Plug,
      schema: CritistryApiWeb.Schema
  end
end
