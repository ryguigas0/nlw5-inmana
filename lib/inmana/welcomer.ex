defmodule Inmana.Welcomer do
  # Recieves a map with a name and a age, as strings
  # If the name is Figo, fIGo, etc. and the age is 12, reply with special message
  # Else if the age is 18 or less then welcome
  # Else don't welcome

  # Matches this function map param to needed variables
  def welcome(%{name: name, age: age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
    |> elem(1)
    |> IO.puts()
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
