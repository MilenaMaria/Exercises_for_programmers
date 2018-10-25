{:ok, response} = Tesla.get("http://api.open-notify.org/astros.json")
people = response.body |> Jason.decode!()

people
|> Map.fetch!("people")
|> Enum.each(&IO.puts("#{String.pad_trailing(&1["name"], 25)} | #{&1["craft"]}"))
