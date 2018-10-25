countSubstring = fn
  _, "" -> 0
  str, sub -> length(String.split(str, sub)) - 1
end

text = File.read!("words.txt") |> IO.inspect()

data = [
  {text, "badger"},
  {text, "mushroom"},
  {text, "snake"}
]

data
|> Enum.sort_by(fn {str, sub} -> countSubstring.(str, sub) end)
|> Enum.reverse()
|> Enum.each(fn {str, sub} ->
  IO.puts("#{sub}: #{String.duplicate("*", countSubstring.(str, sub))}")
end)
