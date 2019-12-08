defmodule CritistryApi.Factory do
  use ExMachina.Ecto, repo: CritistryApi.Repo

  alias CritistryApi.Accounts.User
  alias CritistryApi.Accounts
  alias CritistryApi.Crits.CritRequest
  alias CritistryApi.Crits.CritPost
  alias CritistryApi.Crits

  def user_factory(attrs) do
    image_url = "#{CritistryApiWeb.Endpoint.url()}/images"
    user = %User{
      username: sequence(:username, &"user-#{&1}"),
      avatar: sequence(:avatar, &"#{image_url}/avatars/avatar-#{&1}.png"),
      email: sequence(:email, &"user-#{&1}@gmail.com"),
      crit_requests: build_list(Enum.random(1..attrs[:max_requests]), :crit_request)
    }

    # merge_attributes(user, attrs)
  end

  def crit_request_factory do
    image_url = "#{CritistryApiWeb.Endpoint.url()}/images"
    image_id = Enum.random(0..59)

    %CritRequest{
      image: "#{image_url}/crit-images/crit-image-#{image_id}.jpg",
      title: Elixilorem.sentence(),
      description: Elixilorem.paragraph()
    }
  end

  def crit_post_factory(attrs) do
    request_user = attrs[:request_user]
    requests = Crits.get_crit_request_not_by_user(request_user)

    %CritPost{
      user: Accounts.get_user(request_user),
      crit_request: Enum.random(requests),
      post_text: Elixilorem.paragraph()
    }
    |> IO.inspect()
  end

  def with_crit_requests(user, num_requests) do
    build_list(num_requests, :crit_request, user: user)
  end
end
