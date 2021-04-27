defmodule Inmana.Restaurants.Delete do
  import Ecto.Query

  alias Inmana.{Supply, Restaurant, Repo}

  def call(params) do
    rest_id = params["id"]

    query = from s in Supply, where: s.restaurant_id == ^rest_id
    Repo.delete_all(query)

    rest_del = Repo.get(Restaurant, rest_id)

    case Repo.delete(rest_del) do
      {:ok, restaurant} -> {:ok, restaurant}
      _ -> {:error, %{result: "Restaurant not found", status: :not_found}}
    end
  end
end
