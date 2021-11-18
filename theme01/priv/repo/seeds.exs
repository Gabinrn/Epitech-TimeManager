# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     App.Repo.insert!(%App.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias App.Repo
alias App.Profiles.Users

Repo.insert! %Users{email: "michel@michel.com", username: "Michel D", password: "test", user_role: "admin"}

Repo.insert! %Users{email: "george@george.com", username: "George I", password: "test", user_role: "manager"}

Repo.insert! %Users{email: "paul@paul.fr", username: "Paul K", password: "test", user_role: "employee"}

Repo.insert! %Users{email: "jean@jean.fr", username: "Jean P", password: "test", user_role: "employee"}
