defmodule InmnanaWeb.RestauransViewTest do
  import Phoenix.View

  use InmanaWeb.ConnCase
  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders crate.json" do
      params = %{name: "Stock name", email: "stock@mail.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "stock@mail.com",
                 name: "Stock name",
                 id: _id,
                 inserted_at: _inserted_at,
                 supplies: _supplies
               }
             } = response
    end
  end
end
