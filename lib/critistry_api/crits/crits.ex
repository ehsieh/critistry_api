defmodule CritistryApi.Crits do
  @moduledoc """
  The Crits context.
  """

  import Ecto.Query, warn: false
  alias CritistryApi.Repo
  alias CritistryApi.Accounts.User

  alias CritistryApi.Crits.CritRequest

  def data() do
    Dataloader.Ecto.new(Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end

  @doc """
  Returns the list of crit_requests.

  ## Examples

      iex> list_crit_requests()
      [%CritRequest{}, ...]

  """
  def list_crit_requests do
    Repo.all(CritRequest)
  end

  @doc """
  Gets a single crit_request.

  Raises `Ecto.NoResultsError` if the crit request does not exist.

  ## Examples

      iex> get_crit_request!(123)
      %CritRequest{}

      iex> get_crit_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_crit_request!(id), do: Repo.get!(CritRequest, id)

  @doc """
  Creates a crit_request.

  ## Examples

      iex> create_crit_request(%{field: value})
      {:ok, %CritRequest{}}

      iex> create_crit_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_crit_request(%User{} = user, attrs \\ %{}) do
    %CritRequest{}
    |> CritRequest.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:user, user)
    |> Repo.insert()
    |> IO.inspect
  end

  @doc """
  Updates a crit_request.

  ## Examples

      iex> update_crit_request(crit_request, %{field: new_value})
      {:ok, %CritRequest{}}

      iex> update_crit_request(crit_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_crit_request(%CritRequest{} = crit_request, attrs) do
    crit_request
    |> CritRequest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CritRequest.

  ## Examples

      iex> delete_crit_request(crit_request)
      {:ok, %CritRequest{}}

      iex> delete_crit_request(crit_request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_crit_request(%CritRequest{} = crit_request) do
    Repo.delete(crit_request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking crit_request changes.

  ## Examples

      iex> change_crit_request(crit_request)
      %Ecto.Changeset{source: %CritRequest{}}

  """
  def change_crit_request(%CritRequest{} = crit_request) do
    CritRequest.changeset(crit_request, %{})
  end

  alias CritistryApi.Crits.CritPost

  @doc """
  Returns the list of crit_posts.

  ## Examples

      iex> list_crit_posts()
      [%CritPost{}, ...]

  """
  def list_crit_posts do
    Repo.all(CritPost)
  end

  @doc """
  Gets a single crit_post.

  Raises `Ecto.NoResultsError` if the Crit post does not exist.

  ## Examples

      iex> get_crit_post!(123)
      %CritPost{}

      iex> get_crit_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_crit_post!(id), do: Repo.get!(CritPost, id)

  @doc """
  Creates a crit_post.

  ## Examples

      iex> create_crit_post(%{field: value})
      {:ok, %CritPost{}}

      iex> create_crit_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_crit_post(attrs \\ %{}) do
    %CritPost{}
    |> CritPost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a crit_post.

  ## Examples

      iex> update_crit_post(crit_post, %{field: new_value})
      {:ok, %CritPost{}}

      iex> update_crit_post(crit_post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_crit_post(%CritPost{} = crit_post, attrs) do
    crit_post
    |> CritPost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CritPost.

  ## Examples

      iex> delete_crit_post(crit_post)
      {:ok, %CritPost{}}

      iex> delete_crit_post(crit_post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_crit_post(%CritPost{} = crit_post) do
    Repo.delete(crit_post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking crit_post changes.

  ## Examples

      iex> change_crit_post(crit_post)
      %Ecto.Changeset{source: %CritPost{}}

  """
  def change_crit_post(%CritPost{} = crit_post) do
    CritPost.changeset(crit_post, %{})
  end
end
