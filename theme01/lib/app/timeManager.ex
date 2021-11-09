defmodule App.TimeManager do
  @moduledoc """
  The Workingtimes context.
  """
  import Ecto.Query, warn: false

  alias App.Repo
  alias App.Workingtimes.Workingtime
  alias App.Profiles.Users
  alias App.Clocks.Clock

  def filtered_times(userID, start, stop) do
    Repo.all (from w0 in Workingtime, where: w0.start >= ^start and w0.end <= ^stop and w0.user == ^userID)
  end

  def filtered_user(userID, id) do
    Repo.one!(from w0 in Workingtime, where: w0.user == ^userID and w0.id == ^id)
  end

  def filtered_users(email, username) do
    Repo.all(from u in Users, where: u.email == ^email and u.username == ^username)
  end

  def filtered_clocks(id) do
    Repo.all(from c in Clock, where: c.user == ^id)
  end
end
