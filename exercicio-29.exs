# Handling Bad Input
defmodule BadInput do
  def run do
    validation(read_input())
  end

  def read_input do
    rate =
      IO.gets("What is the rate of return? ")
      |> String.trim()

    rate
  end

  def validation(rate) do
    char = rate |> String.to_charlist()

    validation =
      Map.put(%{}, :contain_letter, Enum.any?(char, &is_letter/1))
      |> Map.put(:contain_number, Enum.any?(char, &is_number_char/1))
      |> Map.put(:contain_special_character, Regex.match?(~r/[^a-zA-Z0-9]/, rate))

    cond do
      validation.contain_special_character and validation.contain_letter and
          validation.contain_number ->
        IO.puts("Sorry. That's not a valid input.")
        run()

      validation.contain_letter and validation.contain_number ->
        IO.puts("Sorry. That's not a valid input.")
        run()

      validation.contain_letter ->
        IO.puts("Sorry. That's not a valid input.")
        run()

      rate == "" ->
        IO.puts("Sorry. That's is not a valid input.")
        run()

      String.to_integer(rate) == 0 ->
        IO.puts("Sorry. 0 is not a valid input.")
        run()

      String.to_integer(rate) < 0 ->
        IO.puts("Sorry. That's is not a valid input.")
        run()

      validation.contain_number ->
        calc_rate(String.to_integer(rate))
    end
  end

  def is_letter(char) do
    char in 65..90 or char in 97..122
  end

  def is_number_char(char) do
    char in 48..57
  end

  def calc_rate(rate) do
    years = trunc(72 / rate)
    IO.puts("It will take #{years} years to double your initial investment.")
  end
end

BadInput.run()
