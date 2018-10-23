# Filtering Values
defmodule FilteringValues do
  def run do
    IO.puts("The even numbers are #{filtro(read())}")
  end

  def read do
    IO.gets("Enter a list: ")
    |> String.trim()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp filtro(list) do
    even = Enum.filter(list, fn x -> rem(x, 2) == 0 end)
    even_list = Enum.join(even, " ")
    even_list
  end
end

FilteringValues.run()
