# Sorting Records
defmodule SortingRecords do
  def run do
    valida(read())
  end

  def read do
    IO.gets("Order by: name, last name, position or date? ")
    |> String.trim()
  end

  def valida("name") do
    sort_name()
  end

  def valida("last name") do
    sort_last()
  end

  def valida("position") do
    sort_position()
  end

  def valida("date") do
    sort_date()
  end

  def valida(_) do
    IO.puts("data Invalida")
    read()
  end

  def calc do
    IO.puts("Name                    | Position      | Separation Date")
    IO.puts("------------------------|---------------|----------------")

    [
      %{
        :name => "John",
        :name_last => "Johnson",
        :position => "Manager",
        :date => "2016-12-31"
      },
      %{
        :name => "Tou",
        :name_last => "Xiong",
        :position => "Software Engineer",
        :date => "2016-10-05"
      },
      %{
        :name => "Sally",
        :name_last => "Weber",
        :position => "Web Developer",
        :date => "2015-12-18"
      },
      %{
        :name => "Michaela",
        :name_last => "Michaelson",
        :position => "District Manager",
        :date => "2015-12-19"
      },
      %{
        :name => "Jake",
        :name_last => "Jacobson",
        :position => "Programmer",
        :date => ""
      },
      %{
        :name => "Jacquelyn",
        :name_last => "Jackson",
        :position => "DBA",
        :date => ""
      }
    ]
  end

  # IO.puts(
  #   Enum.map(name, fn x ->
  #     "#{x[:name]} \t| #{x[:name_last]} \t| #{x[:position]} \t| #{x[:date]} \t\n"
  #   end)
  # )
  def sort_name do
    name = calc()

    Enum.sort_by(name, & &1.name)
    |> Enum.each(
      &IO.puts(
        " #{&1.name} #{String.pad_trailing(&1.name_last, 10)}\t| #{
          String.pad_trailing(&1.position, 15)
        }\t| #{String.pad_trailing(&1.date, 10)}\t\n"
      )
    )
  end

  def sort_last do
    name = calc()

    Enum.sort_by(name, & &1.name_last)
    |> Enum.each(
      &IO.puts(
        " #{&1.name} #{String.pad_trailing(&1.name_last, 10)}\t| #{
          String.pad_trailing(&1.position, 15)
        }\t| #{String.pad_trailing(&1.date, 10)}\t\n"
      )
    )
  end

  def sort_position do
    name = calc()

    Enum.sort_by(name, & &1.position)
    |> Enum.each(
      &IO.puts(
        " #{&1.name} #{String.pad_trailing(&1.name_last, 10)}\t| #{
          String.pad_trailing(&1.position, 15)
        }\t| #{String.pad_trailing(&1.date, 10)}\t\n"
      )
    )
  end

  def sort_date do
    name = calc()

    Enum.sort_by(name, & &1.date)
    |> Enum.each(
      &IO.puts(
        " #{&1.name} #{String.pad_trailing(&1.name_last, 10)}\t| #{
          String.pad_trailing(&1.position, 15)
        }\t| #{String.pad_trailing(&1.date, 10)}\t\n"
      )
    )
  end
end

SortingRecords.run()
