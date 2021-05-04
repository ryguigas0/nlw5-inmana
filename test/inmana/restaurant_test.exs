defmodule Inmana.RestaurantTest do
  # Testing with databases -> Runs the test, then rollback
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "Inmana.Restaurant.changeset/1" do
    test "When the data is valid, return valid changeset" do
      params = %{email: "stock@email.com", name: "cool name"}

      response = Restaurant.changeset(%Restaurant{}, params)

      assert %Changeset{
               changes: %{email: "stock@email.com", name: "cool name"},
               valid?: true
             } = response
    end

    test "When the data is invalid, return a invalid changeset" do
      params = %{email: "stockemail.com", name: "c"}

      response = Restaurant.changeset(%Restaurant{}, params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == %{
               email: ["has invalid format"],
               name: [
                 "should be at least 2 character(s)"
               ]
             }
    end
  end
end
