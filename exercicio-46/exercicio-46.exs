# Word Frequency Finder
defmodule WordFrequencyFinder do
  def run do
    count()
  end

  defp read do
    IO.gets("Word: ")
    |> String.trim()
  end

  def read_file do
    File.read!("words.txt")
  end

  def data do
    word = read()
    text = read_file()

    [
      {text, "badger"},
      {text, "mushroom"},
      {text, "snake"},
      {text, word}
    ]
  end

  def count do
    countSubstring = fn
      _, "" -> 0
      str, sub -> length(String.split(str, sub)) - 1
    end

    data()
    |> Enum.sort_by(fn {str, sub} -> countSubstring.(str, sub) end)
    |> Enum.reverse()
    |> Enum.each(fn {str, sub} ->
      IO.puts("#{sub}: #{String.duplicate("*", countSubstring.(str, sub))}")
    end)
  end
end

WordFrequencyFinder.run()
