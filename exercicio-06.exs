# idade = IO.gets("Qual a sua idade atual? ") |> String.trim() |> String.to_integer()
# idadeM = IO.gets("Idade para aposentadoria? ") |> String.trim() |> String.to_integer()
# date = Date.utc_today()

# anoFalta = fn idadeM, idade -> idadeM - idade end
# anoTira = fn idade -> date.year + idade end

# IO.puts("Faltam #{anoFalta.(idadeM, idade)} anos para você poder retirar.")
# IO.puts("Estamos em #{date.year}, você poderá retirar em #{anoTira.(anoFalta.(idadeM, idade))}.")

# --------------------------------------------------------------------------#

defmodule Aposentadoria do
  def calc do
    idade =
      IO.gets("Qual a sua idade atual? ")
      |> String.trim()
      |> String.to_integer()

    idadeM =
      IO.gets("Idade para aposentadoria? ")
      |> String.trim()
      |> String.to_integer()

    ano_tira(idadeM - idade)
  end

  chora

  defp ano_tira(idade) when idade > 0 do
    date = Date.utc_today().year

    IO.puts(
      "Faltam #{idade} anos para você poder retirar.\n" <>
        "Estamos em #{date}, você poderá retirar em #{date + idade}."
    )
  end

  defp ano_tira(_idade), do: IO.puts("Já pode retirar")
end

Aposentadoria.calc()
