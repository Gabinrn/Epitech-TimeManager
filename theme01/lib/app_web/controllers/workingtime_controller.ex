defmodule AppWeb.WorkingtimeController do
  use AppWeb, :controller

  alias App.Workingtimes
  alias App.TimeManager
  alias App.Workingtimes.Workingtime

  action_fallback AppWeb.FallbackController

#  def index(conn, _params) do
#    workingtimes = Workingtimes.list_workingtimes()
#    render(conn, "index.json", workingtimes: workingtimes)
#end

  def index(conn, %{"userID" => userID ,"start" => start, "end" => stop}) do
    times = TimeManager.filtered_times(userID, start, stop)
    render(conn, "index.json", workingtimes: times)
  end

  def show_custom(conn, %{"userID" => userID ,"id" => id}) do
    times = TimeManager.filtered_user(userID, id)
    render(conn, "show.json", workingtime: times)
  end


  def create_custom(conn, %{"userID" => userID , "workingtimes" => workingtimes}) do
    workingTime_params = Map.put(workingtimes, "user", userID)
    with {:ok, %Workingtime{} = workingtime} <- Workingtimes.create_workingtime(workingTime_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show_custom, userID ,workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end

  def show(conn, %{"id" => id}) do
    workingtime = Workingtimes.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- Workingtimes.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = Workingtimes.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- Workingtimes.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
