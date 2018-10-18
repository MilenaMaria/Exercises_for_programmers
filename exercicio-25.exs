# Password Strength Indicator
defmodule Password do
  def calc do
    # [^a-zA-Z0-9] carctere especial
    pass =
      IO.gets("Password:")
      |> String.trim()

    char = pass |> String.to_charlist()

    validation =
      Map.put(%{}, :contain_letter, Enum.any?(char, &is_letter/1))
      |> Map.put(:contain_number, Enum.any?(char, &is_number_char/1))
      |> Map.put(:contain_special_character, Regex.match?(~r/[^a-zA-Z0-9]/, pass))

    variavel =
      cond do
        validation.contain_special_character and validation.contain_letter and
          validation.contain_number and String.length(pass) >= 8 ->
          "very strong"

        validation.contain_letter and validation.contain_number and String.length(pass) >= 8 ->
          "strong"

        validation.contain_letter ->
          "weak"

        validation.contain_number ->
          "very weak"
      end

    # fazer mais uma verificação em que só letras ou numeros devem ser maiores que 8

    IO.puts("Te password '#{pass}' is a #{variavel} password.")
  end

  def is_letter(char) do
    char in 65..90 or char in 97..122
  end

  def is_number_char(char) do
    char in 48..57
  end

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
