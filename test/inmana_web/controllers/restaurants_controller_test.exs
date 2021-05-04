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

  describe "get/1" do
    test "When the uuid is valid, return a restaurant", %{conn: conn} do
      params = %{name: "cool name", email: "stock@email.com"}

      response =
        conn
        # Create the restaurant
        |> post(Routes.restaurants_path(conn, :create, params))
        # Prepares the response
        |> json_response(:created)

      created_restaurant = response["restaurant"]
      created_id = created_restaurant["id"]

      response =
        conn
        # Do a post on the route
        |> get(Routes.restaurants_path(conn, :show, created_id))
        # Assert the status and if its json
        |> json_response(:found)

      assert %{
               "restaurant" => %{
                 "email" => "stock@email.com",
                 "name" => "cool name",
                 "id" => _id
               },
               "message" => "Restaurant found!"
             } = response
    end

    test "When the id is invalid, returns not found", %{conn: conn} do
      response =
        conn
        # Do a post on the route
        |> get(Routes.restaurants_path(conn, :show, "9a80c003-7a84-4f42-bffc-3d149f1dca62"))
        # Assert the status and if its json
        |> json_response(:not_found)

      assert %{"mensage" => "Restaurant not found"} = response
    end
  end

  describe "delete/1" do
    test "When the uuid is valid, delete a restaurant", %{conn: conn} do
      params = %{name: "cool name", email: "stock@email.com"}

      response =
        conn
        # Create the restaurant
        |> post(Routes.restaurants_path(conn, :create, params))
        # Prepares the response
        |> json_response(:created)

      created_restaurant = response["restaurant"]
      created_id = created_restaurant["id"]

      response =
        conn
        # Do a delete on the route
        |> delete(Routes.restaurants_path(conn, :delete, created_id))
        # Assert the status and if its json
        |> json_response(:ok)

      assert %{
               "message" => "Restaurant was deleted!"
             } = response
    end

    test "When the id is invalid, returns not found", %{conn: conn} do
      response =
        conn
        # Do a post on the route
        |> get(Routes.restaurants_path(conn, :show, "9a80c003-7a84-4f42-bffc-3d149f1dca62"))
        # Assert the status and if its json
        |> json_response(:not_found)

      assert %{"mensage" => "Restaurant not found"} = response
    end
  end
end
