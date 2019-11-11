defmodule CritistryApi.CritsTest do
  use CritistryApi.DataCase

  alias CritistryApi.Crits

  describe "crit_requests" do
    alias CritistryApi.Crits.CritRequest

    @valid_attrs %{description: "some description", image: "some image", title: "some title"}
    @update_attrs %{
      description: "some updated description",
      image: "some updated image",
      title: "some updated title"
    }
    @invalid_attrs %{description: nil, image: nil, title: nil}

    def crit_request_fixture(attrs \\ %{}) do
      {:ok, crit_request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Crits.create_crit_request()

      crit_request
    end

    test "list_crit_requests/0 returns all crit_requests" do
      crit_request = crit_request_fixture()
      assert Crits.list_crit_requests() == [crit_request]
    end

    test "get_crit_request!/1 returns the crit_request with given id" do
      crit_request = crit_request_fixture()
      assert Crits.get_crit_request!(crit_request.id) == crit_request
    end

    test "create_crit_request/1 with valid data creates a crit_request" do
      assert {:ok, %critRequest{} = crit_request} = Crits.create_crit_request(@valid_attrs)
      assert crit_request.description == "some description"
      assert crit_request.image == "some image"
      assert crit_request.title == "some title"
    end

    test "create_crit_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Crits.create_crit_request(@invalid_attrs)
    end

    test "update_crit_request/2 with valid data updates the crit_request" do
      crit_request = crit_request_fixture()
      assert {:ok, crit_request} = Crits.update_crit_request(crit_request, @update_attrs)
      assert %critRequest{} = crit_request
      assert crit_request.description == "some updated description"
      assert crit_request.image == "some updated image"
      assert crit_request.title == "some updated title"
    end

    test "update_crit_request/2 with invalid data returns error changeset" do
      crit_request = crit_request_fixture()
      assert {:error, %Ecto.Changeset{}} = Crits.update_crit_request(crit_request, @invalid_attrs)
      assert crit_request == Crits.get_crit_request!(crit_request.id)
    end

    test "delete_crit_request/1 deletes the crit_request" do
      crit_request = crit_request_fixture()
      assert {:ok, %critRequest{}} = Crits.delete_crit_request(crit_request)
      assert_raise Ecto.NoResultsError, fn -> Crits.get_crit_request!(crit_request.id) end
    end

    test "change_crit_request/1 returns a crit_request changeset" do
      crit_request = crit_request_fixture()
      assert %Ecto.Changeset{} = Crits.change_crit_request(crit_request)
    end
  end

  describe "crit_posts" do
    alias CritistryApi.Crits.CritPost

    @valid_attrs %{post_text: "some post_text"}
    @update_attrs %{post_text: "some updated post_text"}
    @invalid_attrs %{post_text: nil}

    def crit_post_fixture(attrs \\ %{}) do
      {:ok, crit_post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Crits.create_crit_post()

      crit_post
    end

    test "list_crit_posts/0 returns all crit_posts" do
      crit_post = crit_post_fixture()
      assert Crits.list_crit_posts() == [crit_post]
    end

    test "get_crit_post!/1 returns the crit_post with given id" do
      crit_post = crit_post_fixture()
      assert Crits.get_crit_post!(crit_post.id) == crit_post
    end

    test "create_crit_post/1 with valid data creates a crit_post" do
      assert {:ok, %CritPost{} = crit_post} = Crits.create_crit_post(@valid_attrs)
      assert crit_post.post_text == "some post_text"
    end

    test "create_crit_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Crits.create_crit_post(@invalid_attrs)
    end

    test "update_crit_post/2 with valid data updates the crit_post" do
      crit_post = crit_post_fixture()
      assert {:ok, crit_post} = Crits.update_crit_post(crit_post, @update_attrs)
      assert %CritPost{} = crit_post
      assert crit_post.post_text == "some updated post_text"
    end

    test "update_crit_post/2 with invalid data returns error changeset" do
      crit_post = crit_post_fixture()
      assert {:error, %Ecto.Changeset{}} = Crits.update_crit_post(crit_post, @invalid_attrs)
      assert crit_post == Crits.get_crit_post!(crit_post.id)
    end

    test "delete_crit_post/1 deletes the crit_post" do
      crit_post = crit_post_fixture()
      assert {:ok, %CritPost{}} = Crits.delete_crit_post(crit_post)
      assert_raise Ecto.NoResultsError, fn -> Crits.get_crit_post!(crit_post.id) end
    end

    test "change_crit_post/1 returns a crit_post changeset" do
      crit_post = crit_post_fixture()
      assert %Ecto.Changeset{} = Crits.change_crit_post(crit_post)
    end
  end
end
