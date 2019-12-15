defmodule CritistryApiWeb.Schema do
  use Absinthe.Schema
  import_types(CritistryApiWeb.Schema.ContentTypes)

  alias CritistryApi.{Accounts, Crits}
  alias CritistryApiWeb.Resolvers
  alias CritistryApiWeb.Schema.Middleware

  def plugins do
    [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]
  end

  def context(ctx) do
    loader =
      Dataloader.new()
      |> Dataloader.add_source(Accounts, Accounts.data())
      |> Dataloader.add_source(Crits, Crits.data())

    Map.put(ctx, :loader, loader)
  end

  # Queries
  query do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve(&Resolvers.User.list_users/3)
    end

    @desc "Get all crit requests"
    field :crit_requests, list_of(:crit_request) do
      resolve(&Resolvers.CritRequest.list_crit_requests/3)
    end

    @desc "Get all crit posts"
    field :crit_posts, list_of(:crit_post) do
      resolve(&Resolvers.CritPost.list_crit_posts/3)
    end

    @desc "Get the currently signed-in user"
    field :me, :user do
      resolve(&Resolvers.User.me/3)
    end

    @desc "Get crit request details"
    field :crit_request, :crit_request do
      arg(:id, non_null(:string))
      resolve(&Resolvers.CritRequest.get_crit_request/3)
    end

    @desc "Get crit post details"
    field :crit_post, :crit_post do
      arg(:id, non_null(:string))
      resolve(&Resolvers.CritPost.get_crit_post/3)
    end
  end

  # Mutations
  mutation do
    @desc "Create a crit request"
    field :create_crit_request, :crit_request do
      arg(:title, non_null(:string))
      arg(:description, non_null(:string))
      arg(:image, non_null(:string))
      middleware(Middleware.Authenticate)
      resolve(&Resolvers.CritRequest.create_crit_request/3)
    end

    @desc "Create a crit post"
    field :create_crit_post, :crit_post do
      arg(:post_text, non_null(:string))
      arg(:annotation, :string)
      arg(:crit_request_id, non_null(:id))
      middleware(Middleware.Authenticate)
      resolve(&Resolvers.CritPost.create_crit_post/3)
    end

    @desc "Create a user account"
    field :signup, :session do
      arg(:username, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.User.signup/3)
    end

    @desc "Sign in a user"
    field :signin, :session do
      arg(:username, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&Resolvers.User.signin/3)
    end
  end
end
