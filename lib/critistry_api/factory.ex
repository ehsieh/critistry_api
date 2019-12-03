defmodule CritistryApi.Factory do
  use ExMachina.Ecto, repo: CritistryApi.Repo

  def user_factory do
    %CritistryApi.Accounts.User{
      username: sequence(:username, &"user-#{&1}"),
      email: sequence(:email, &"user-#{&1}@gmail.com"),
      crit_requests: build_list(Enum.random(1..4), :crit_request)
    }
  end

  def crit_request_factory do
    image_url = "#{CritistryApiWeb.Endpoint.url()}/images"

    %CritistryApi.Crits.CritRequest{
      image: sequence(:group_image, &"#{image_url}/crit-images/crit-image-#{&1}.jpg"),
      title: Elixilorem.sentence(),
      description: Elixilorem.paragraph(),
      crit_posts: build_list(Enum.random(1..4), :crit_post)
    }
  end

  def crit_post_factory do
    %CritistryApi.Crits.CritPost{
      post_text: Elixilorem.paragraph()
    }
  end

  def with_crit_requests(user, num_requests) do
    build_list(num_requests, :crit_request, user: user)
  end
end
