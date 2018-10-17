# Anagram checker
defmodule Anagram do
  def calc do
    IO.puts("Enter two strings and I'll tell you if they are anagrams:")

    first =
      IO.gets("Enter the first string: ")
      |> String.trim()

    second =
      IO.gets("Enter the second string: ")
      |> String.trim()

    # a(first, second)
    IO.puts("\"#{first}\" and \"#{second}\" are #{check(isAnagram(first, second))} anagrams. ")
  end

  # defp isAnagram(first, second) do
  #   first == String.reverse(second)
  # end

  defp isAnagram(first, second) do
    first
    |> to_charlist()
    |> Enum.sort() ==
      second
      |> to_charlist()
      |> Enum.sort()
  end

  defp check(false), do: "not"
  defp check(true), do: ""
end

Anagram.calc()
