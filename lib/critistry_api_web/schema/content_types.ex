defmodule CritistryApiWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :user do    
    field :username, :string
  end

  object :crit_request do
    field :image, :string
    field :title, :string
    field :description, :string
    field :request_by_user, :string
  end

  object :crit_post do
    field :crit_request_id, :string
    field :post_text, :string
    field :post_by_user, :string
  end
end