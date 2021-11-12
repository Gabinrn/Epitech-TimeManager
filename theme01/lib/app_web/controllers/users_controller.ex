defmodule AppWeb.UsersController do
  use AppWeb, :controller

  alias App.Profiles
  alias App.Profiles.Users
  alias App.TimeManager
  alias App.Authentification.Token

  action_fallback AppWeb.FallbackController

 #def index(conn, _params) do
   # users = Profiles.list_users()
  #  render(conn, "index.json", users: users)
 # end

  def index(conn, %{"username" => username, "email" => email}) do
    users = TimeManager.filtered_users(email, username)
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"users" => users_params}) do
    with {:ok, %Users{} = users} <- Profiles.create_users(users_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.users_path(conn, :show, users))
      |> render("show.json", users: users)
    end
  end

  def show(conn, %{"id" => id}) do
    users = Profiles.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = Profiles.get_users!(id)

    with {:ok, %Users{} = users} <- Profiles.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = Profiles.get_users!(id)

    with {:ok, %Users{}} <- Profiles.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end

  def logout(conn, _params) do
    put_req_header(conn, "Bearer", "")
    send_resp(conn, :no_content, "")
  end

  def signin(conn, %{"email" => email, "password" => password}) do
    case Comeonin.Bcrypt.check_pass(Profiles.get_by_email(email), password, hash_key: :hashed_password) do
      {:ok, users} ->
        expire = DateTime.add(DateTime.utc_now(), 36000, :second)

        {:ok, token, _claims} =
          Token.generate_and_sign(%{
            "userid" => users.id,
            "role" => users.user_role,
            "expiry" => expire
          })

        {:ok, token}
          conn
          |> put_status(:ok)
          |> send_resp(200, token)
      {:error, reason} ->
        conn
        |> send_resp(401, reason)
    end
  end
end
