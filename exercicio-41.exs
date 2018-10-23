# Name Sorter
defmodule NameSorter do
  def run do
    list()
  end

  def list do
    name = [
      %{:last_name => "Ling", :name => "Mai"},
      %{:last_name => "Johnson", :name => "Jim"},
      %{:last_name => "Zarneck", :name => "Sabrina"},
      %{:last_name => "Jones", :name => "Chris"},
      %{:last_name => "Jones", :name => "Aaron"},
      %{:last_name => "Swift", :name => "Geoffrey"},
      %{:last_name => "Xiong", :name => "Fong"}
    ]

    IO.puts("Total of #{Enum.count(name)} names")
    IO.puts("----------------------------------")

    Enum.sort_by(name, & &1.last_name)
    |> Enum.each(&IO.puts("#{&1.last_name}, #{&1.name}"))
  end
end

NameSorter.run()
