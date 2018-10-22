# Picking a Winner
defmodule PickingWinner do
  def run do
    name = read_names(1, [])
    IO.puts(name)
  end

  def read(_n) do
    IO.gets("Enter a name: ")
    |> String.trim()
  end

  def read_names(atual, names) do
    name = read(atual)

    if name != "" do
      names = [name | names]
      read_names(atual + 1, names)
    else
      sort(names)
    end
  end

  def sort(names) do
    sort = Enum.random(names)
    IO.puts("The winner is #{sort}.")
  end
end

PickingWinner.run()
