# Comparing Numbers
defmodule ComparingN do
  def read_numbers(n) do
    number =
      IO.gets("Enter the #{n} number ")
      |> String.trim()
      |> String.to_integer()

    number
  end

  defp add_more? do
    IO.gets("Do you want add more values??")
    |> String.trim()
    |> String.upcase() == "Y"
  end

  def read_numbers(atual \\ 1, numbers \\ []) do
    number = read_numbers(atual)
    numbers = [number | numbers]

    if add_more?() do
      read_numbers(atual + 1, numbers)
    else
      numbers |> Enum.reverse()
    end
  end

  def read_numbers do
    stream = Stream.cycle([0])

    Enum.reduce_while(stream, {1, []}, fn _, {atual, numbers} ->
      number = read_numbers(atual)
      numbers = [number | numbers]

      if add_more?() do
        {:cont, {atual + 1, numbers}}
      else
        {:halt, numbers |> Enum.reverse()}
      end
    end)
  end

  def run do
    numbers = read_numbers()
    # numbers |> IO.inspect()
    numbers |> IO.inspect() |> Enum.max() |> IO.puts()
    # IO.inspect(Enum.max(numbers))
  end
end

ComparingN.run()
