defmodule App.WorkingtimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Workingtimes` context.
  """

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{
        end: ~N[2021-10-25 15:08:00],
        start: ~N[2021-10-25 15:08:00]
      })
      |> App.Workingtimes.create_workingtime()

    workingtime
  end
end
