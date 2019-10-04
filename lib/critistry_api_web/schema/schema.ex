defmodule CritistryApiWeb.Schema do

  use Absinthe.Schema
  import_types CritistryApiWeb.Schema.ContentTypes

  alias CritistryApiWeb.Resolvers

  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &Resolvers.User.list_users/3
    end

    @desc "Get all crit requests"
    field :crit_requests, list_of(:crit_request) do
      resolve &Resolvers.CritRequest.list_crit_requests/3
    end

    desc "Get all crit posts"
    field :crit_posts, list_of(:crit_post) do
      resolve &Resolvers.CritPost.list_crit_posts/3
    end
  end  
end