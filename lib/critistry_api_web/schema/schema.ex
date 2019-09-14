defmodule CritistryApiWeb.Schema do

  use Absinthe.Schema
  import_types CritistryApiWeb.Schema.ContentTypes

  alias CritistryApiWeb.Resolvers

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &Resolvers.User.list_users/3
    end
  end
end