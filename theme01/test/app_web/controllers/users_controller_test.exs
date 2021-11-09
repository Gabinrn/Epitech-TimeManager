defmodule AppWeb.UsersControllerTest do
  use AppWeb.ConnCase

  import App.ProfilesFixtures

  alias App.Profiles.Users

  @create_attrs %{
    email: "some email",
    username: "some username"
  }
  @update_attrs %{
    email: "some updated email",
    username: "some updated username"
  }
  @invalid_attrs %{email: nil, username: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create users" do
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.users_path(conn, :create), users: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete users" do
    setup [:create_users]
  end

  defp create_users(_) do
    users = users_fixture()
    %{users: users}
  end
end
