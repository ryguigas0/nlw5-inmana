defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end

  def show(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.show_restaurant(params) do
      conn
      |> put_status(:found)
      |> render("show.json", restaurant: restaurant)
    end
  end

  def delete(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.delete_restaurant(params) do
      conn
      |> put_status(:ok)
      |> render("delete.json", restaurant: restaurant)
    end
  end

  def update(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.update_restaurant(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", restaurant: restaurant)
    end
  end
end
