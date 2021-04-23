defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  # Which function to test
  describe "welcome/1" do
    # What does the test do
    test "when the user is special, return special message" do
      params = %{"name" => "Figo", "age" => "12"}

      # Get the result
      result = Welcomer.welcome(params)

      # Check if its the expected result
      assert result == {:ok, "You are a wizard figo!"}
    end

    test "when the user is not special, welcome" do
      params = %{"name" => "RANDOM NAME", "age" => "18"}

      {result, _} = Welcomer.welcome(params)

      assert result == :ok
    end

    test "when the users underage, dont welcome and error" do
      params = %{"name" => "RANDOM NAME", "age" => "17"}

      {result, _} = Welcomer.welcome(params)

      assert result == :error
    end
  end
end
