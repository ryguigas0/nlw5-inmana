defmodule InmanaWeb.RestaurantsControllerTest do
  # Test controller
  use InmanaWeb.ConnCase

  test_id

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
                 "id" => test_id
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
    # TODO: Fix this test
    # test "When the uuid is valid, return a restaurant", %{conn: conn} do
    #   response =
    #     conn
    #     # Do a post on the route
    #     |> get(Routes.restaurants_path(conn, :show, "9a80c003-7a84-4f42-bffc-3d149f1dca61"))
    #     # Assert the status and if its json
    #     |> json_response(:not_found)

    #   assert %{
    #            "mensage" => "Restaurant found!",
    #            "restaurant" => %{
    #              "email" => "vokimil402@hype68.com",
    #              "name" => "Gamers united",
    #              "id" => "9a80c003-7a84-4f42-bffc-3d149f1dca61"
    #            }
    #          } = response
    # end

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

  # TODO: Do restaurant deletion test
end
