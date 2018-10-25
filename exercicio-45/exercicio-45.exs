# Word Finder
defmodule WordFinder do
  def run do
    re_write()
  end

  defp read do
    IO.gets("Name file: ")
    |> String.trim()
  end

  defp read_file do
    File.read!("file.txt") |> to_string()
  end

  defp re_write do
    name = read()
    text = String.replace(read_file(), "utilize", "use")
    # numero de replace
    File.write!("#{name}.txt", text)
  end
end

WordFinder.run()
