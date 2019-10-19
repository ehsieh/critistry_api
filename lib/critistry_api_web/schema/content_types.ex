defmodule CritistryApiWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias CritistryApi.{Accounts, Crits}  

  object :user do    
    field :id, :id
    field :username, :string
    field :crit_requests, list_of(:crit_request), resolve: dataloader(Crits)
    field :crit_posts, list_of(:crit_post), resolve: dataloader(Crits)
  end

  object :crit_request do
    field :id, :id
    field :image, :string
    field :title, :string
    field :description, :string
    field :user, non_null(:user), resolve: dataloader(Accounts)    
    field :crit_posts, list_of(:crit_post), resolve: dataloader(Crits)
  end

  object :crit_post do
    field :id, :id
    field :crit_request_id, :string
    field :post_text, :string
    field :post_by_user, :string
    field :crit_request, non_null(:crit_request), resolve: dataloader(Crits)
    field :user, non_null(:user), resolve: dataloader(Accounts)
  end
end