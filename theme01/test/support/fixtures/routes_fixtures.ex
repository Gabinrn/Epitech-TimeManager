defmodule App.RoutesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Routes` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        email: "some email",
        username: "some username"
      })
      |> App.Routes.create_users()

    users
  end
end
