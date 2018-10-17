# Printing Quotes

quotation = IO.gets("Whats is the quote? ") |> String.trim()
author = IO.gets("Who said it? ") |> String.trim()
IO.puts("#{author}, \"#{quotation}\"")
# pag 14
