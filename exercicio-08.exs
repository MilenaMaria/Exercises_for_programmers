defmodule Pizza do
  @pieces 8
  def piece do
    people =
      IO.gets("How many people? ")
      |> String.trim()
      |> String.to_integer()

    pizzas =
      IO.gets("How many pizzas do you have? ")
      |> String.trim()
      |> String.to_integer()

    piece_each(people, pizzas)
  end

  defp piece_each(people, pizzas) do
    resto = rem(pizzas * @pieces, people)
    divi = div(pizzas * @pieces, people)
    IO.puts("#{people} people with #{pizzas} pizzas")
    IO.puts("Each person gets #{divi} pieces of pizza.")
    IO.puts("There are #{resto} leftover pieces")
  end
end

Pizza.piece()
