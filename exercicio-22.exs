# Comparing Numbers
defmodule Comparing do
  def calc do
    first =
      IO.gets("Enter the first number ")
      |> String.trim()
      |> String.to_integer()

    second =
      IO.gets("Enter the first number ")
      |> String.trim()
      |> String.to_integer()

    third =
      IO.gets("Enter the first number ")
      |> String.trim()
      |> String.to_integer()

    a(first, second, third)
  end

  defp a(first, second, third) when first >= second and first >= third,
    do: IO.puts("The largest number #{first}")

  defp a(first, second, third) when second >= first and second >= third,
    do: IO.puts("The largest number #{second}")

  defp a(first, second, third) when third >= second and third >= first,
    do: IO.puts("The largest number #{third}")
end

# ----------------------------------------------------------------------------#
# Comparing Numbers
defmodule ComparingN do
  def read_numbers(n) do
    number =
      IO.gets("Enter the #{n} number ")
      |> String.trim()
      |> String.to_integer()

    number
  end

  def read_numbers(atual, numbers) do
    number = read_numbers(atual)
    numbers = [number | numbers]

    if atual < 3 do
      read_numbers(atual + 1, numbers)
    else
      numbers |> Enum.reverse()
    end
  end

  def run do
    numbers = read_numbers(1, [])
    numbers |> Enum.max() |> IO.puts()
    # IO.inspect(Enum.max(numbers))
  end
end

ComparingN.run()
