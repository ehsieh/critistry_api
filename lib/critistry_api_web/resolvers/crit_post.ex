defmodule CritistryApiWeb.Resolvers.CritPost do
    def list_crit_posts(_parent, _args, _resolution) do
        {:ok, [
            %{post_text: "text1", post_by_user: "user1"}, 
            %{post_text: "text2", post_by_user: "user2"}, 
            %{post_text: "text3", post_by_user: "user3"}, 
            %{post_text: "text4", post_by_user: "user4"}, 
            %{post_text: "text5", post_by_user: "user5"},
              ]
        }
    end
end