defmodule AppWeb.UsersController do
  use AppWeb, :controller

  alias App.Routes
  alias App.Routes.Users
  alias App.TimeManager

  action_fallback AppWeb.FallbackController

 #def index(conn, _params) do
   # users = Routes.list_users()
  #  render(conn, "index.json", users: users)
 # end

  def index(conn, %{"username" => username, "email" => email}) do
    users = TimeManager.filtered_users(email, username)
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"users" => users_params}) do
    with {:ok, %Users{} = users} <- Routes.create_users(users_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.users_path(conn, :show, users))
      |> render("show.json", users: users)
    end
  end

  def show(conn, %{"id" => id}) do
    users = Routes.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = Routes.get_users!(id)

    with {:ok, %Users{} = users} <- Routes.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = Routes.get_users!(id)

    with {:ok, %Users{}} <- Routes.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
