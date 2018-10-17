defmodule Recursion do
  def print_multiple_times(n) when n <= 1 do
    a = IO.gets("input ")
    IO.puts(a)
  end

  def print_multiple_times(n) do
    a = IO.gets("input ")
    IO.puts(a)
    print_multiple_times(n - 1)
  end
end

Recursion.print_multiple_times(4)
