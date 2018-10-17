# Multistate Sales Tax Calculator
defmodule TaxSale do
  def calc do
    amount =
      IO.gets("what is the order amount? ")
      |> String.trim()
      |> String.to_float()

    state =
      IO.gets("What state do you live in?: ")
      |> String.trim()

    amout_final = amount + state(state, amount)
    IO.puts("The total is #{amout_final}")
  end

  def state("Wisconsin", am) do
    name =
      IO.gets("What condad do you live in?: ")
      |> String.trim()

    county(name, am)
  end

  def state("Illinois", am) do
    am * 0.04
  end

  def county("Eau Claire", am) do
    am * 0.05
  end

  def county("Dunn", am) do
    am * 0.05
    # IO.puts("#{am * 0.05}")
  end
end

TaxSale.calc()
