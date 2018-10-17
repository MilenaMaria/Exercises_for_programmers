# Password Strength Indicator
defmodule Password do
  def calc do
    pass =
      IO.gets("Password:")
      |> String.trim()

    char = pass |> String.to_charlist()

    validation =
      Map.put(%{}, :contain_letter, Enum.any?(char, &is_letter/1))
      |> Map.put(:contain_number, Enum.any?(char, &is_number/1))
      |> Map.put(:contain_special_character, Enum.any?(char, &is_character/1))

    variavel =
      cond do
        validation.contain_special_character and validation.contain_letter and
          validation.contain_number and String.length(pass) >= 8 ->
          "very strong"

        validation.contain_letter and validation.contain_number and String.length(pass) >= 8 ->
          "strong"

        validation.contain_letter and String.length(pass) < 8 ->
          "weak"

        validation.contain_number and String.length(pass) < 8 ->
          "very weak"
      end

    IO.puts("Te password \'#{pass}\' is a #{variavel} password")
    # IO.puts("Te password is #{variavel}")
  end

  def is_letter(char) do
    char in 65..90 or char in 97..122
  end

  def is_character(char) do
    not is_letter(char) and not is_number(char)
  end

  # uma função para cada verifiação

  # defp strong(pass) do
  #   case pass do
  #     1 -> "very weak"
  #     2 -> "weak"
  #     3 -> "strong"
  #     4 -> "very strong"
  #   end
  # end
end

Password.calc()
