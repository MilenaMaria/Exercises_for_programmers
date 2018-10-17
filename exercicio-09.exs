defmodule Paint do
  @gallon 350
  def calc do
    length =
      IO.gets("What's the length in feet? ")
      |> String.trim()
      |> String.to_integer()

    width =
      IO.gets("What's the width in feet? ")
      |> String.trim()
      |> String.to_integer()

    area(length, width)
  end

  # Float.ceil()
  defp area(length, width) do
    square_area = length * width
    paint_area = trunc(Float.ceil(square_area / @gallon))

    IO.puts(
      "You will need to puschase #{paint_area} gallons of \n" <>
        "paint to cover #{square_area} square feet"
    )
  end
end

Paint.calc()
