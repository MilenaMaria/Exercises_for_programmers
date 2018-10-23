# Password Generator
defmodule PasswordGenerator do
  # terminar
  def run do
    numbers = generate_num(read_n())
    letters = generate_string(read_l())
    generate_pass(numbers, letters)
  end

  def read_l do
    IO.gets("What's the minimum length? ")
    |> String.trim()
    |> String.to_integer()
  end

  # special_char =
  #   IO.gets("How many special characters? ")
  #   |> String.trim()
  #   |> String.to_integer()

  def read_n do
    IO.gets("How many numbers? ")
    |> String.trim()
    |> String.to_integer()
  end

  defp generate_num(qtd_numbers) do
    Enum.take_random(1..9, qtd_numbers)
  end

  defp generate_string(qtd_letters) do
    l = Enum.take_random(?a..?z, qtd_letters)
    a = l |> to_string() |> String.codepoints()
    a
  end

  defp generate_pass(numbers, letters) do
    list = letters ++ numbers
    b = list |> Enum.shuffle()
    # IO.inspect(a)
    pass = Enum.join(b)
    IO.puts("Your password is #{pass}")
  end
end

PasswordGenerator.run()
