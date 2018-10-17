defmodule Tax do
  @tax 5.5
  def calc do
    amount =
      IO.gets("What is the order amount? ")
      |> String.trim()
      |> String.to_integer()

    state =
      IO.gets("What is the state?: ")
      |> String.trim()
      |> String.upcase()

    calcula_taxa(amount, state)
  end

  defp calcula_taxa(amount, state) when state == "WI" do
    tax = amount * (@tax / 100)
    total = amount + tax
    IO.puts("The total is $#{amount}\nThe tax is $ #{tax}\nThe total is #{total}")
  end

  defp calcula_taxa(amount, _) do
    IO.puts("The total is $#{amount}")
  end
end

Tax.calc()
