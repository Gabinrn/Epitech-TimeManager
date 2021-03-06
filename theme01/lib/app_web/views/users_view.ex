defmodule AppWeb.UsersView do
  use AppWeb, :view
  alias AppWeb.UsersView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{
      id: users.id,
      username: users.username,
      email: users.email,
      user_role: users.user_role,
      hashed_password: users.hashed_password
    }
  end
end
