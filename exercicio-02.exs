string = IO.gets("What is the input string? ") |> String.trim()
# tamanho = String.length(string)
IO.inspect(String.trim("#{string} has #{String.length(string)} characters."))
