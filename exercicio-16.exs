# Legal Driving Age
defmodule LegalAge do
  def calc do
    # countries =
    #   IO.gets("Where are you from? BR or USA")
    #   |> String.trim()

    age =
      IO.gets("What is the order amount? ")
      |> String.trim()
      |> String.to_integer()

    valida(age)
  end

  # def estado(countries) do
  #   valida()
  # end

  defp valida(age) when age < 16 and age > 0 do
    IO.puts("You are not old enough to legally drive.")
  end

  defp valida(age) when age >= 16 and age <= 120 do
    IO.puts("You are old enough to legally drive.")
  end

  defp valida(_) do
    IO.puts("Idade inválida")
  end
end

LegalAge.calc()
