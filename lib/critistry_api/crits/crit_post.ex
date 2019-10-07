defmodule CritistryApi.Crits.CritPost do
  use Ecto.Schema
  import Ecto.Changeset


  schema "crit_posts" do
    field :post_text, :string
    field :crit_request_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(crit_post, attrs) do
    crit_post
    |> cast(attrs, [:post_text])
    |> validate_required([:post_text])
  end
end
