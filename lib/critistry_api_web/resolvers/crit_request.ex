defmodule CritistryApiWeb.Resolvers.CritRequest do
    def list_crit_requests(_parent, _args, _resolution) do
        {:ok, [
                %{image: "image1", title: "title1", description: "description1", request_by_user: "user1"}, 
                %{image: "image2", title: "title2", description: "description2", request_by_user: "user2"}, 
                %{image: "image3", title: "title3", description: "description3", request_by_user: "user3"}, 
                %{image: "image4", title: "title4", description: "description4", request_by_user: "user4"}, 
                %{image: "image5", title: "title5", description: "description5", request_by_user: "user5"}, 
              ]
        }
    end
end