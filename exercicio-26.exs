# Months to Pay of a Credit Card
defmodule MonthsPay do
  def read_item do
    balance =
      IO.gets("What is your balance? ")
      |> String.trim()
      |> String.to_integer()

    apr =
      IO.gets("What is the APR on the card (as a percent)? ")
      |> String.trim()
      |> String.to_integer()

    payment =
      IO.gets("What is the monthly payment you can make? ")
      |> String.trim()
      |> String.to_integer()

    # %{price: price, qtd: qtd}
    calc(balance, apr, payment)
  end

  def calc(balance, apr, payment) do
    i = apr / 100 / 365
    b_p = balance / payment

    (-(1 / 30) * :math.log(1 + b_p * (1 - :math.pow(1 + i, 30))) / :math.log(1 + i))
    |> Float.ceil()
    |> trunc()
  end

  def run do
    months = read_item()

    IO.puts("It will take you #{months} months to pay off this card.")
  end
end

MonthsPay.run()
