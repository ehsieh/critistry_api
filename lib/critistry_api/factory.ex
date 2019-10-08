defmodule CritistryApi.Factory do
    use ExMachina.Ecto, repo: CritistryApi.Repo

    def user_factory do
        %CritistryApi.Accounts.User{
            username: "username",
            email: "user@email.com",
        }    
    end

    def crit_request_factory do
        %CritistryApi.Crits.CirtRequest{
            image: sequence(:group_image, &"/crit-images/crit-request-#{&1}.jpg"),
            title: Elixilorem.sentence,
            description: Elixilorem.paragraph,      
            user: build(:user)      
        }
    end
end