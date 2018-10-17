# Blood Alcohol Calculator
defmodule Blood do
  def calc do
    weight =
      IO.gets("Peso? ")
      |> String.trim()
      |> String.to_float()

    gender =
      IO.gets("Qual o seu genero? F/M ")
      |> String.trim()
      |> String.upcase()

    qtd =
      IO.gets("Quantidade de bebidas? ")
      |> String.trim()
      |> String.to_integer()

    time =
      IO.gets("Há quantas horas tomou a ultima bebida? ")
      |> String.trim()
      |> String.to_integer()

    valida(weight, gender, qtd, time)
  end

  defp valida(weight, gender, qtd, time) when gender == "F" do
    bac = Float.round(qtd * 5.14 / (weight * 0.66) - 0.015 * time, 3)
    IO.puts("Seu BCA é #{bac}")

    if bac >= 0.08 do
      IO.puts("It is not legal for you drive.")
    else
      IO.puts("It legal for you drive.")
    end
  end

  defp valida(weight, gender, qtd, time) when gender == "M" do
    bac = Float.round(qtd * 5.14 / (weight * 0.73) - 0.015 * time, 3)
    IO.puts("Seu BCA é #{bac}")

    if bac >= 0.08 do
      IO.puts("It is not legal for you drive.")
    else
      IO.puts("It legal for you drive.")
    end
  end

  # defp valida((weight, gender, qtd, time)) do
  #   IO.puts("Valor inválido")
  # end
end

Blood.calc()
