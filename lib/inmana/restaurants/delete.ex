defmodule Inmana.Restaurants.Delete do
  import Ecto.Query

  alias Inmana.{Supply, Restaurant, Repo}

  def call(params) do
    rest_id = params["id"]

    # Delete all the related supplies
    query = from s in Supply, where: s.restaurant_id == ^rest_id
    Repo.delete_all(query)

    # Get the restaurant to delete
    rest_del = Repo.get(Restaurant, rest_id)

    case Repo.delete(rest_del) do
      {:ok, restaurant} -> {:ok, restaurant}
      _ -> {:error, %{result: "Restaurant not found", status: :not_found}}
    end
  end
end
