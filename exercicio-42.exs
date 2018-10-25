# Parsing a Data File
defmodule DataFile do
  def run do
    IO.puts("Last       First       Salary")
    IO.puts("-----------------------------")
    converte()
  end

  def list do
    File.read!("exercicio-42b.txt")
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ","))
  end

  def converte do
    list()
    |> Enum.sort_by(&Enum.at(&1, 2))
    |> Enum.each(
      &IO.puts(
        "#{String.pad_trailing(Enum.at(&1, 0), 10)} #{String.pad_trailing(Enum.at(&1, 1), 10)}  U$ #{
          Enum.at(&1, 2)
        }"
      )
    )
  end
end

DataFile.run()
