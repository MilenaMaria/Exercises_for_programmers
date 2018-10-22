# Computing Statistics
defmodule ComputingStatistics do
  def run do
    read_names(1, [])
  end

  def read(_n) do
    IO.gets("Enter a number:")
    |> String.trim()

    # |> String.to_integer()
  end

  def read_names(atual, numbers) do
    number = read(atual)

    if number != "done" do
      a = number |> String.to_integer()
      numbers = [a | numbers]
      read_names(atual + 1, numbers)
    else
      calc(numbers)
    end
  end

  def calc(numbers) do
    avg = Enum.sum(numbers) / Enum.count(numbers)
    max = Enum.max(numbers)
    min = Enum.min(numbers)
    # desvio = std(a, loc = 0, escala = 1)
    print(avg, max, min)
  end

  def print(avg, max, min) do
    IO.puts("The average is #{avg}.")
    IO.puts("The minimum is #{min}.")
    IO.puts("The maximum is #{max}.")
  end
end

ComputingStatistics.run()
