# Self-Checkout
defmodule SelfCheckmodeold do
  @tax_rate 0.055

  def calc(n) when n <= 1 do
    price =
      IO.gets("Enter the price of item: ")
      |> String.trim()
      |> String.to_integer()

    qtd =
      IO.gets("Enter the quantity of item: ")
      |> String.trim()
      |> String.to_integer()

    calc_total(price, qtd)
  end

  def calc(n) do
    price =
      IO.gets("Enter the price of item: ")
      |> String.trim()
      |> String.to_integer()

    qtd =
      IO.gets("Enter the quantity of item: ")
      |> String.trim()
      |> String.to_integer()

    calc_total(price, qtd)
    calc(n - 1)
  end

  defp calc_total(price, qtd) do
    sub_total = price * qtd
    tax = sub_total * @tax_rate
    total = sub_total + tax
    IO.puts("Subtotal: #{sub_total}\nTax: #{tax}\nTotal: #{total}")
  end
end

# ----------------------------------------------------------------------------#

defmodule SelfCheck do
  @tax_rate 0.055

  def read_item(n) do
    price =
      IO.gets("Enter the price of item #{n}: ")
      |> String.trim()
      |> String.to_integer()

    qtd =
      IO.gets("Enter the quantity of item #{n}: ")
      |> String.trim()
      |> String.to_integer()

    %{price: price, qtd: qtd}
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
  def read_itens(atual, itens) do
    item = read_item(atual)
    itens = [item | itens]

    if add_more?() do
      read_itens(atual + 1, itens)
    else
      itens |> Enum.reverse()
    end
  end

  def calc(itens) do
    sub =
      itens
      |> Enum.map(fn x -> x.qtd * x.price end)
      |> Enum.sum()

    tax = sub * @tax_rate
    total = tax + sub

    {sub, tax, total}
  end

  def run do
    # qtd, atual, itens)
    itens = read_itens(1, [])

    {sub, tax, total} = calc(itens)

    IO.puts("Subtotal: #{sub}\nTax: #{tax}\nTotal: #{total}")
  end
end

SelfCheck.run()
