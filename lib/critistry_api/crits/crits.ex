defmodule CritistryApi.Crits do
  @moduledoc """
  The Crits context.
  """

  import Ecto.Query, warn: false
  alias CritistryApi.Repo

  alias CritistryApi.Crits.CirtRequest

  @doc """
  Returns the list of crit_requests.

  ## Examples

      iex> list_crit_requests()
      [%CirtRequest{}, ...]

  """
  def list_crit_requests do
    Repo.all(CirtRequest)
  end

  @doc """
  Gets a single cirt_request.

  Raises `Ecto.NoResultsError` if the Cirt request does not exist.

  ## Examples

      iex> get_cirt_request!(123)
      %CirtRequest{}

      iex> get_cirt_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cirt_request!(id), do: Repo.get!(CirtRequest, id)

  @doc """
  Creates a cirt_request.

  ## Examples

      iex> create_cirt_request(%{field: value})
      {:ok, %CirtRequest{}}

      iex> create_cirt_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cirt_request(attrs \\ %{}) do
    %CirtRequest{}
    |> CirtRequest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cirt_request.

  ## Examples

      iex> update_cirt_request(cirt_request, %{field: new_value})
      {:ok, %CirtRequest{}}

      iex> update_cirt_request(cirt_request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cirt_request(%CirtRequest{} = cirt_request, attrs) do
    cirt_request
    |> CirtRequest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CirtRequest.

  ## Examples

      iex> delete_cirt_request(cirt_request)
      {:ok, %CirtRequest{}}

      iex> delete_cirt_request(cirt_request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cirt_request(%CirtRequest{} = cirt_request) do
    Repo.delete(cirt_request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cirt_request changes.

  ## Examples

      iex> change_cirt_request(cirt_request)
      %Ecto.Changeset{source: %CirtRequest{}}

  """
  def change_cirt_request(%CirtRequest{} = cirt_request) do
    CirtRequest.changeset(cirt_request, %{})
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
