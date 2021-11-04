defmodule AppWeb.ClockController do
  use AppWeb, :controller
  import Logger


  alias App.Clocks
  alias App.Clocks.Clock
  alias App.TimeManager

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    clocks = Clocks.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"userID" => userID ,"clock" => clock_params}) do
    clock_params = Map.put(clock_params, "user", userID)
    Logger.info("AAAAAAAAAAAAAAAAAAAAAAAAc #{inspect(clock_params)}")
    with {:ok, %Clock{} = clock} <- Clocks.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end


  def index(conn, %{"userID" => userID}) do
    clocks = TimeManager.filtered_clocks!(userID)
    render(conn, "index.json", clock: clocks)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Clocks.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Clocks.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Clocks.get_clock!(id)

    with {:ok, %Clock{}} <- Clocks.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
