defmodule AppWeb.ClockControllerTest do
  use AppWeb.ConnCase

  import App.ClocksFixtures

  alias App.Clocks.Clock

  @create_attrs %{
    status: true,
    time: ~N[2021-10-25 15:08:00]
  }
  @update_attrs %{
    status: false,
    time: ~N[2021-10-26 15:08:00]
  }
  @invalid_attrs %{status: nil, time: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "delete clock" do
    setup [:create_clock]
  end

  defp create_clock(_) do
    clock = clock_fixture()
    %{clock: clock}
  end
end
