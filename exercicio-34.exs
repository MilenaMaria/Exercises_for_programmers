# Employee List Removal
defmodule ListRemove do
  def run do
    employee = ["John Smith", "Jackie Jackson", "Chris Jones", "Amanda Cullen", "Jeremy Goodwin"]
    remove_list(employee)
  end

  defp read do
    IO.gets("Enter an employee name to remove:")
    |> String.trim()
  end

  def remove_list(employee) do
    if Enum.count(employee) > 0 do
      number = Enum.count(employee)
      IO.puts("There are #{number} employees:")
      IO.puts(Enum.each(employee, fn x -> IO.puts(x) end))
      name = read()
      employees = remove(employee, name)
      remove_more(employees)
    else
      IO.puts("Empty list")
    end
  end

  defp remove(employee, name) do
    List.delete(employee, name)
  end

  defp remove_more(employee) do
    option =
      IO.gets("Remove more? ")
      |> String.trim()
      |> String.upcase()

    if option == "Y" do
      remove_list(employee)
    end
  end
end

ListRemove.run()
