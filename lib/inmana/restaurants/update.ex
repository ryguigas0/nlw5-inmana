defmodule Inmana.Restaurants.Update do
  alias Inmana.{Restaurant, Repo}

  def call(params) do
    to_update = Repo.get(Restaurant, params["id"])
    changes = Restaurant.changeset(to_update, params)
    Repo.update(changes)
  end
end
