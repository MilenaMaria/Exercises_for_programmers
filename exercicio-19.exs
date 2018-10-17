# BMI Calculator
defmodule BMI do
  def calc do
    weight =
      IO.gets("Peso: ")
      |> String.trim()
      |> String.to_float()

    height =
      IO.gets("Altura: ")
      |> String.trim()
      |> String.to_float()

    bmi = calculo(weight, height)
    IO.puts("#{c(bmi)}")
  end

  defp calculo(weight, height) when weight >= 0 and height >= 0 do
    weight / (height * height)
  end

  def c(bmi) when bmi <= 18.5, do: "Magreza"
  def c(bmi) when bmi <= 25.0, do: "Saudável"
  def c(bmi) when bmi <= 30.0, do: "Obesidade Grau I"
  def c(bmi) when bmi <= 40.0, do: "Obesidade Grau II"
  def c(bmi) when bmi > 40, do: "Obesidade Grau III"
end

BMI.calc()
