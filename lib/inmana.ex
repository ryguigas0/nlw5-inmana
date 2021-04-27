defmodule Inmana do
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  # Facade pattern
  alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.Restaurants.Get, as: RestaurantShow
  alias Inmana.Restaurants.Delete, as: RestaurantDelete

  alias Inmana.Supplies.Create, as: SuppliesCreate
  alias Inmana.Supplies.Delete, as: SupplyDelete
  alias Inmana.Supplies.Get, as: SupplyGet
  # alias Inmana.Supplies.Update, as: SupplyUpdate

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate show_restaurant(params), to: RestaurantShow, as: :call
  defdelegate delete_restaurant(params), to: RestaurantDelete, as: :call

  defdelegate create_supply(params), to: SuppliesCreate, as: :call
  defdelegate get_supply(uuid), to: SupplyGet, as: :call
  defdelegate delete_supply(uuid), to: SupplyDelete, as: :call
  # defdelegate update_supply(params), to: SupplyUpdate, as: :call
end
