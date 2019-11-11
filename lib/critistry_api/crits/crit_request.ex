defmodule CritistryApi.Crits.CritRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "crit_requests" do
    field(:description, :string)
    field(:image, :string)
    field(:title, :string)
    belongs_to(:user, CritistryApi.Accounts.User)
    has_many(:crit_posts, CritistryApi.Crits.CritPost)

    timestamps()
  end

  @doc false
  def changeset(cirt_request, attrs) do
    cirt_request
    |> cast(attrs, [:title, :description, :image])
    |> validate_required([:title, :description, :image])
  end
end
