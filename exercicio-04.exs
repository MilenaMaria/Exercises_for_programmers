# Mad Lib

# noun = IO.gets("Enter a noum: ") |> String.trim()
# verb = IO.gets("Enter a verb: ") |> String.trim()
# adjective = IO.gets("Enter an adjective: ") |> String.trim()
# adverb = IO.gets("Enter an adverb: ") |> String.trim()

# IO.puts("Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!")

words = [
  noun1 = IO.gets("Enter a noum: ") |> String.trim(),
  verb1 = IO.gets("Enter a verb: ") |> String.trim(),
  adjective1 = IO.gets("Enter an adjective: ") |> String.trim(),
  adverb1 = IO.gets("Enter an adverb: ") |> String.trim()
]

[a, b, c, d] = words

IO.puts("Do you #{b} your #{c} #{a} #{d}? That's hilarious!")
