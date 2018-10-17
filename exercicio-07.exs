# length =
#   IO.gets("What's the length of the room in feet? ") |> String.trim() |> String.to_integer()

# width = IO.gets("What's the width of the room in feet? ") |> String.trim() |> String.to_integer()

# area = fn length, width -> length * width end
# area_Q = Float.round(area.(length, width) * 0.09290304, 3)
# IO.puts("You entered dimensions of #{length} feet by #{width} feet.")

# IO.puts("The area is \n#{area.(length, width)} square feet \n#{area_Q} square meters")

# -------------------------------------------------------------------------------------------------#
defmodule CalcArea do
  @constante 0.09290304

  def calc do
    length =
      IO.gets("What's the length of the room in feet? ")
      |> String.trim()
      |> String.to_integer()

    width =
      IO.gets("What's the width of the room in feet? ")
      |> String.trim()
      |> String.to_integer()

    area(length, width)
  end

  defp area(length, width) do
    area_Q = length * width
    area_F = Float.round(area_Q * @constante, 3)

    IO.puts("You entered dimensions of #{length} feet by #{width} feet.")
    IO.puts("The area is \n#{area_Q} square feet \n#{area_F} square meters")
  end
end

CalcArea.calc()
