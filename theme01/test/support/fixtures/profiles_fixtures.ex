defmodule App.ProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Profiles` context.
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
      |> App.Profiles.create_users()

    users
  end
end
