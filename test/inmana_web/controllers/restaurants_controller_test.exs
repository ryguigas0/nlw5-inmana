defmodule InmanaWeb.RestaurantsControllerTest do
  # Test controller
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "When the params are valid, create a restaurant", %{conn: conn} do
      params = %{name: "cool name", email: "stock@email.com"}

      response =
        conn
        # Do a post on the route
        |> post(Routes.restaurants_path(conn, :create, params))
        # Assert the status and if its json
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "stock@email.com",
                 "name" => "cool name",
                 # id is always different, so the value does not matter
                 "id" => _id
               }
             } = response
    end

    test "When the params are invalid, returns an error", %{conn: conn} do
      params = %{name: "c", email: "stockemail.com"}

      response =
        conn
        # Do a post on the route
        |> post(Routes.restaurants_path(conn, :create, params))
        # Assert the status and if its json
        |> json_response(:bad_request)

      assert %{
               "mensage" => %{
                 "email" => ["has invalid format"],
                 "name" => ["should be at least 2 character(s)"]
               }
             } = response
    end
  end
end
