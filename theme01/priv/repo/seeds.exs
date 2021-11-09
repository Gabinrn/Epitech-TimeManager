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

Repo.insert! %Users{email: "user1@test.com", username: "U1", password: "password1", user_role: "admin"}

Repo.insert! %Users{email: "user2@test.com", username: "U2", password: "password2", user_role: "manager"}

Repo.insert! %Users{email: "user3@test.fr", username: "U3", password: "password3", user_role: "employee"}
