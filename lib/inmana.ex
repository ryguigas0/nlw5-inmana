defmodule Inmana do
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  # Facade pattern
  alias Inmana.Restaurants.Create, as: RestaurantCreate

  alias Inmana.Supplies.Create, as: SuppliesCreate
  alias Inmana.Supplies.Get, as: SupplyGet

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call

  defdelegate create_supply(params), to: SuppliesCreate, as: :call
  defdelegate get_supply(uuid), to: SupplyGet, as: :call
end
