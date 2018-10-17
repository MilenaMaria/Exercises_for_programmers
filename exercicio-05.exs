# Simple math

first = IO.gets("Whats is the first number? ") |> String.trim() |> String.to_integer()
second = IO.gets("Whats is the second number? ") |> String.trim() |> String.to_integer()

# IO.puts("#{first} + #{second} =  #{first + second}")
# IO.puts("#{first} - #{second} =  #{first - second}")
# IO.puts("#{first} * #{second} =  #{first * second}")
# IO.puts("#{first} / #{second} =  #{div(first, second)}")

soma = fn first, second -> first + second end
sub = fn first, second -> first - second end
mult = fn first, second -> first * second end
d = fn first, second -> div(first, second) end

IO.puts(soma.(first, second))
IO.puts(sub.(first, second))
IO.puts(mult.(first, second))
IO.puts(d.(first, second))

# --------------------------------------------------------------------------#

defmodule SimpleMath do
end
