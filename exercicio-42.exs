# Parsing a Data File
defmodule DataFile do
  def run do
    IO.puts("Last       First       Salary")
    IO.puts("-----------------------------")
    IO.inspect(converte())
  end

  def list do
    [
      ["Ling, Mai, 55900"] |> to_string() |> String.split(","),
      ["Johnson, Jim, 56500"] |> to_string() |> String.split(","),
      ["Zarneck, Sabrina, 46000"] |> to_string() |> String.split(","),
      ["Jones, Chris, 34500"] |> to_string() |> String.split(","),
      ["Jones, Aaron, 14200"] |> to_string() |> String.split(","),
      ["Swift, Geoffrey, 65000"] |> to_string() |> String.split(","),
      ["Xiong, Fong, 51500"] |> to_string() |> String.split(",")
    ]
  end

  def converte do
    list()
    |> Enum.sort_by(&Enum.at(&1, 2))
    |> Enum.each(
      &IO.puts(
        "#{String.pad_trailing(Enum.at(&1, 0), 8)} #{String.pad_trailing(Enum.at(&1, 1), 10)}  U$#{
          Enum.at(&1, 2)
        }"
      )
    )
  end
end

DataFile.run()
