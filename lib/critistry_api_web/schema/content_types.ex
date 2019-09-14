defmodule CritistryApiWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :user do    
    field :username, :string
  end
end