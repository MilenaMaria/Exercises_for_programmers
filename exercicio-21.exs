# Numbers to Names

# defp mes(numero) do
#   case numero do
#     1 -> "January"
#     2 -> "February"
#     3 -> "March."
#     4 -> "April"
#     5 -> "May"
#     6 -> "June"
#     7 -> "July"
#     8 -> "August"
#     9 -> "September"
#     10 -> "October"
#     11 -> "November"
#     12 -> "December"
#     _ -> "mês inválido"
#   end
# end

defmodule NumbersNames do
  def calc do
    language =
      IO.gets("Please enter your language: ")
      |> String.trim()
      |> String.upcase()

    numero =
      IO.gets("Please enter the number of the month: ")
      |> String.trim()
      |> String.to_integer()

    # IO.puts("The name of the month is #{mes(numero)}")
    nome = mes()[String.to_atom(language)][numero]
    # map e a localização no map [linguagem][numero]
    IO.puts(nome(language, nome))
  end

  defp mes do
    %{
      PT: %{
        1 => "Janeiro",
        2 => "Fevereiro",
        3 => "Março",
        4 => "Abril",
        5 => "Maio",
        6 => "Junho",
        7 => "Julho",
        8 => "Agosto",
        9 => "Setembro",
        10 => "Outubro",
        11 => "Novembro",
        12 => "Dezembro"
      },
      EN: %{
        1 => "January",
        2 => "February",
        3 => "March.",
        4 => "April",
        5 => "May",
        6 => "June",
        7 => "July",
        8 => "August",
        9 => "September",
        10 => "October",
        11 => "November",
        12 => "December"
        # _ => "mês inválido"
      }
    }
  end

  defp nome("EN", num), do: "The name of the month is #{num}"
  defp nome("PT", num), do: "O nome do mês é #{num}"
  defp nome(_, _), do: "linguagem invalida"
end

NumbersNames.calc()
