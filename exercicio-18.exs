# # Temperature Converter
# defmodule Temperature do
#   def calc do
#     temperature =
#       IO.gets(
#         "Press C to convert from Fahrenheit to Celsius.\nPress F to convert from Celsius to Fahrenheit. "
#       )
#       |> String.trim()
#       |> String.upcase()

#     IO.puts("Your choice: #{temperature}")

#     converter(temperature)
#   end

#   defp converter(temperature) when temperature == "C" do
#     fa =
#       IO.gets("Please enter the temperature in Fahrenheit: /int ")
#       |> String.trim()
#       |> String.to_integer()

#     ce = (fa - 32) * 5 / 9
#     IO.puts("The temperature in Celsius is #{ce}")
#   end

#   defp converter(temperature) when temperature == "F" do
#     ce =
#       IO.gets("Please enter the temperature in Celsius: /int ")
#       |> String.trim()
#       |> String.to_integer()

#     fa = ce * 9 / 5 + 32
#     IO.puts("The temperature in Fahrenrenheit is #{fa}")
#   end

#   defp converter(temperature) when temperature == "F" do
#     ce =
#       IO.gets("Please enter the temperature in Celsius: /int ")
#       |> String.trim()
#       |> String.to_integer()

#     fa = ce * 9 / 5 + 32
#     IO.puts("The temperature in Fahrenrenheit is #{fa}")
#   end
# end

# Temperature.calc()
# Temperature Converter

# ------------------------------------------------------------------------------#
defmodule Temperature do
  def calc do
    from =
      IO.gets("Press C to Celsius.\nPress F to Fahrenheit.\nPress K to Kelvin.\n ")
      |> String.trim()
      |> String.upcase()

    to =
      IO.gets("Press C to Celsius.\nPress F to Fahrenheit.\nPress K to Kelvin.\n ")
      |> String.trim()
      |> String.upcase()

    IO.puts("Your choice: #{from}")

    val = read(from)
    IO.puts("The temperature in #{tem(to)} is #{converter(from, to, val)}")
  end

  defp tem("F"), do: "Fahrenheit"
  defp tem("C"), do: "Celsius"
  defp tem("K"), do: "Kelvin"

  # defp tem(t) do
  #   case t do
  #     "F" -> "Fahrenheit"
  #     "C" -> "Celsius"
  #     "K" -> "Kelvin"
  #   end
  # end

  defp read(temperature) do
    IO.gets("Please enter the temperature in #{tem(temperature)} /int ")
    |> String.trim()
    |> String.to_integer()
  end

  def converter("F", "C", f), do: (f - 32) * 1.8
  def converter("C", "F", c), do: c * 9 / 5 + 32
  def converter("C", "K", c), do: c + 273
  def converter("K", "C", k), do: k - 273
  def converter("F", "K", f), do: Float.round((f - 32) / 9 * 5 + 273, 2)
  def converter("K", "F", k), do: Float.round((k - 273) / 5 * 9 + 32, 2)
end

Temperature.calc()
