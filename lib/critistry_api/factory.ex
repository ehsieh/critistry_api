defmodule CritistryApi.Factory do
    use ExMachina.Ecto, repo: CritistryApi.Repo

    def user_factory do
        %CritistryApi.Accounts.User{
            username: sequence(:username, &"user-#{&1}"),
            email: sequence(:username, &"user-#{&1}@gmail.com"),
            crit_requests: build_list(10, :crit_request),
            crit_posts: build_list(10, :crit_post)
        }    
    end

    def crit_request_factory do
        %CritistryApi.Crits.CritRequest{
            image: sequence(:group_image, &"/crit-images/crit-request-#{&1}.jpg"),
            title: Elixilorem.sentence,
            description: Elixilorem.paragraph
        }
    end

    def crit_post_factory do
        %CritistryApi.Crits.CritPost{
            post_text: Elixilorem.paragraph,            
        }
    end
end