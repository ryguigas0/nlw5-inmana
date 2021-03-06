defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    # Supply
    # |> Repo.get(uuid)
    # |> handle_get()

    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply not found", status: :not_found}}
      supply -> {:ok, supply}
    end
  end

  # defp handle_get(%Supply{} = result), do: {:ok, result: result}
  # defp handle_get(nil), do: {:error, %{result: "Supply no found", status: :not_found}}
end
