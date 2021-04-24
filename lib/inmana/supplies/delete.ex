defmodule Inmana.Supplies.Delete do
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    supply = Repo.get(Supply, uuid)

    case Repo.delete(supply) do
      {:ok, supply} -> {:ok, supply}
      {:error, _changeset} -> {:error, %{result: "Supply not found", status: :not_found}}
    end
  end
end
