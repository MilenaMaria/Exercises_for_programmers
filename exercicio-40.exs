# Filtering Records
defmodule FilteringRecords do
  def run do
  end

  def read do
    IO.gets("Enter a search string: ")
    |> String.trim()
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

  defp find(word) do
    name = calc()
    IO.puts("Results")
    IO.puts("Name                    | Position         | Separation Date")
    IO.puts("------------------------|------------------|----------------")

    Enum.each(&IO.puts(
          " #{&1.name} #{String.pad_trailing(&1.name_last, 10)}\t| #{
            String.pad_trailing(&1.position, 15)
          }\t| #{String.pad_trailing(&1.date, 10)}\t\n"
        )


  end
end

FilteringRecords.run()
