# Adding Numbers
defmodule AddingNumbers do
  def read_item(n) do
    number =
      IO.gets("Enter a number #{n}: ")
      |> String.trim()
      |> String.to_integer()

    number
  end

  defp add_more? do
    IO.gets("Add mais?")
    |> String.trim()
    |> String.upcase() == "Y"
  end

  # recursão possui 3 momentos
  # - posição atual
  # - o que será recebido
  # - como será alterado

  # qtd só é utilizanod quando se sabe o valor final
  # def read_itens(qtd, atual, itens) do
  def read_itens(atual, numbers) do
    number = read_item(atual)
    numbers = [number | numbers]

    if add_more?() do
      read_itens(atual + 1, numbers)
    else
      numbers |> Enum.reverse()
    end
  end

  def run do
    # qtd, atual, itens)
    itens = read_itens(1, [])
    IO.puts("The total is #{Enum.sum(itens)}")
  end
end

AddingNumbers.run()
