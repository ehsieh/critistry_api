# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CritistryApi.Repo.insert!(%CritistryApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import CritistryApi.Factory

insert_list(20, :user, %{ max_requests: 5})
|> Enum.map(fn u -> insert_list(Enum.random(1..10), :crit_post, %{ request_user: u.id }) end)