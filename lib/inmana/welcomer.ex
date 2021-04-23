defmodule Inmana.Welcomer do
  # Else don't welcome

  # Matches this function map param to needed variables
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)

    # |> IO.puts()
  end

  # Run the matching function
  defp evaluate("figo", 12) do
    {:ok, "You are a wizard figo!"}
  end

  # If this matches and conditions are met
  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You are not welcome here, #{name}"}
  end
end
