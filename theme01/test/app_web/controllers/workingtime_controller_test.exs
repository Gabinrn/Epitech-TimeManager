defmodule AppWeb.WorkingtimeControllerTest do
  use AppWeb.ConnCase

  import App.WorkingtimesFixtures

  alias App.Workingtimes.Workingtime

  @create_attrs %{
    end: ~N[2021-10-25 15:08:00],
    start: ~N[2021-10-25 15:08:00]
  }
  @update_attrs %{
    end: ~N[2021-10-26 15:08:00],
    start: ~N[2021-10-26 15:08:00]
  }
  @invalid_attrs %{end: nil, start: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end



end
