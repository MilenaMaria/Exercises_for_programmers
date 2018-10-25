# Who’s in Space?
defmodule WhosSpace do
  def run do
    print(read_file())
  end

  defp read_file do
    {:ok, response} = Tesla.get("http://api.open-notify.org/astros.json")
    people = response.body |> Jason.decode!()
    people
  end

  defp print(people) do
    IO.puts("Name                      | Craft")
    IO.puts("--------------------------|------")

    people
    |> Map.fetch!("people")
    |> Enum.each(&IO.puts("#{String.pad_trailing(&1["name"], 25)} | #{&1["craft"]}"))
  end
end

WhosSpace.run()
