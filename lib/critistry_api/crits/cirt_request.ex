defmodule CritistryApi.Crits.CirtRequest do
  use Ecto.Schema
  import Ecto.Changeset


  schema "crit_requests" do
    field :description, :string
    field :image, :string
    field :title, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(cirt_request, attrs) do
    cirt_request
    |> cast(attrs, [:title, :description, :image])
    |> validate_required([:title, :description, :image])
  end
end
