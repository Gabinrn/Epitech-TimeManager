defmodule App.WorkingtimesTest do
  use App.DataCase

  alias App.Workingtimes

  describe "workingtimes" do
    alias App.Workingtimes.Workingtime

    import App.WorkingtimesFixtures

    @invalid_attrs %{end: nil, start: nil}

    test "create_workingtime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workingtimes.create_workingtime(@invalid_attrs)
    end

  end
end
