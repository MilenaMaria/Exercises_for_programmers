defmodule Conversion do
  @rate_dolar 100.00278326449991
  def calc do
    euros =
      IO.gets("How many euros are you exchanging? ")
      |> String.trim()
      |> String.to_integer()

    rate =
      IO.gets("What is the exchange rate? ")
      |> String.trim()
      |> String.to_float()

    converte(euros, rate)
  end

  defp converte(euros, rate) do
    amont = Float.round(euros * rate / @rate_dolar, 2)

    IO.puts("#{euros} euros at an exchange rate of #{rate} is\n#{amont} U.S dollars.")
  end
end

Conversion.calc()
