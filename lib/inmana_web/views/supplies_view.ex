defmodule InmanaWeb.SuppliesView do
  use InmanaWeb, :view

  def render("create.json", %{supply: supply}),
    do: %{
      message: "Supply created!",
      supply: supply
    }

  def render("show.json", %{supply: supply}), do: %{supply: supply}

  def render("delete.json", %{supply: _supply}),
    do: %{mensage: "The supply was deleted"}

  def render("update.json", %{supply: supply}),
    do: %{mensage: "The supply was updated", supply: supply}
end
