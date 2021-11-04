defmodule App.ClocksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Clocks` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{
        status: true,
        time: ~N[2021-10-25 15:08:00]
      })
      |> App.Clocks.create_clock()

    clock
  end
end
