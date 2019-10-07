defmodule CritistryApi.CritsTest do
  use CritistryApi.DataCase

  alias CritistryApi.Crits

  describe "crit_requests" do
    alias CritistryApi.Crits.CirtRequest

    @valid_attrs %{description: "some description", image: "some image", title: "some title"}
    @update_attrs %{description: "some updated description", image: "some updated image", title: "some updated title"}
    @invalid_attrs %{description: nil, image: nil, title: nil}

    def cirt_request_fixture(attrs \\ %{}) do
      {:ok, cirt_request} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Crits.create_cirt_request()

      cirt_request
    end

    test "list_crit_requests/0 returns all crit_requests" do
      cirt_request = cirt_request_fixture()
      assert Crits.list_crit_requests() == [cirt_request]
    end

    test "get_cirt_request!/1 returns the cirt_request with given id" do
      cirt_request = cirt_request_fixture()
      assert Crits.get_cirt_request!(cirt_request.id) == cirt_request
    end

    test "create_cirt_request/1 with valid data creates a cirt_request" do
      assert {:ok, %CirtRequest{} = cirt_request} = Crits.create_cirt_request(@valid_attrs)
      assert cirt_request.description == "some description"
      assert cirt_request.image == "some image"
      assert cirt_request.title == "some title"
    end

    test "create_cirt_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Crits.create_cirt_request(@invalid_attrs)
    end

    test "update_cirt_request/2 with valid data updates the cirt_request" do
      cirt_request = cirt_request_fixture()
      assert {:ok, cirt_request} = Crits.update_cirt_request(cirt_request, @update_attrs)
      assert %CirtRequest{} = cirt_request
      assert cirt_request.description == "some updated description"
      assert cirt_request.image == "some updated image"
      assert cirt_request.title == "some updated title"
    end

    test "update_cirt_request/2 with invalid data returns error changeset" do
      cirt_request = cirt_request_fixture()
      assert {:error, %Ecto.Changeset{}} = Crits.update_cirt_request(cirt_request, @invalid_attrs)
      assert cirt_request == Crits.get_cirt_request!(cirt_request.id)
    end

    test "delete_cirt_request/1 deletes the cirt_request" do
      cirt_request = cirt_request_fixture()
      assert {:ok, %CirtRequest{}} = Crits.delete_cirt_request(cirt_request)
      assert_raise Ecto.NoResultsError, fn -> Crits.get_cirt_request!(cirt_request.id) end
    end

    test "change_cirt_request/1 returns a cirt_request changeset" do
      cirt_request = cirt_request_fixture()
      assert %Ecto.Changeset{} = Crits.change_cirt_request(cirt_request)
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
