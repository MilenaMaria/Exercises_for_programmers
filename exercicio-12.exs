defmodule Interest do
  def calc do
    principal =
      IO.gets("Enter the principal: ")
      |> String.trim()
      |> String.to_integer()

    rate =
      IO.gets("Enter the rate of interest: ")
      |> String.trim()
      |> String.to_float()

    years =
      IO.gets("Enter the number of years: ")
      |> String.trim()
      |> String.to_integer()

    converte(principal, rate, years)
  end

  defp converte(principal, rate, years) do
    tax = principal * (rate / 100)
    investment = Float.round(principal + tax * years)
    IO.puts("After #{years} years at #{rate}%, the investment will be worth $#{investment}.")
  end
end

Interest.calc()
