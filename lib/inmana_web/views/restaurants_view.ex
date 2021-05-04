defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end

  def render("show.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant found!",
      restaurant: restaurant
    }
  end

  def render("delete.json", %{restaurant: _restaurant}) do
    %{
      message: "Restaurant was deleted!"
    }
  end

  def render("update.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant was updated!",
      restaurant: restaurant
    }
  end
end
