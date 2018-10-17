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

    comp =
      IO.gets("What is the number of times the interest is compounder per year? ")
      |> String.trim()
      |> String.to_integer()

    converte(principal, rate, years, comp)
  end

  defp converte(principal, rate, years, comp) do
    # tax = principal * (rate / 100)
    # investment = Float.round(principal + tax * years)

    inves = principal * :math.pow(1 + rate / 100 / 4, comp * years)
    investment = Float.round(inves, 2)

    IO.puts(
      "$#{principal} invested at #{rate}%, for #{years} years" <>
        "\ncompounded #{comp} times per year is $#{investment}."
    )
  end
end

Interest.calc()
