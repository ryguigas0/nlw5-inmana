defmodule Inmana.Restaurants.Get do
  alias Inmana.{Repo, Restaurant}

  def call(params) do
    case Repo.get(Restaurant, params["id"]) do
      nil -> {:error, %{result: "Restaurant not found", status: :not_found}}
      restaurant -> {:ok, restaurant}
    end
  end
end
