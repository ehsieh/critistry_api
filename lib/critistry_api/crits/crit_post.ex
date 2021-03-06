defmodule CritistryApi.Crits.CritPost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "crit_posts" do
    field(:post_text, :string)
    field(:annotation, :string)
    belongs_to(:crit_request, CritistryApi.Crits.CritRequest)
    belongs_to(:user, CritistryApi.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(crit_post, attrs) do
    crit_post
    |> cast(attrs, [:post_text, :annotation, :crit_request_id])
    |> validate_required([:post_text])
  end
end
