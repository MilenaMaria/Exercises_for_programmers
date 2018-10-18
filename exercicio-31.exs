# Karvonen Heart Rate
defmodule HeartRate do
  ## terminar
  def read do
    pulses =
      IO.gets("Resting Pulses: ")
      |> String.trim()
      |> String.to_integer()

    age =
      IO.gets("Age: ")
      |> String.trim()
      |> String.to_integer()

    target_heart_rate(pulses, age)
  end

  def target_heart_rate(pulses, age) do
    IO.puts("Intensity | Rate  \t\n" <> "..........|.......\t\n")

    for n <- 55..95, rem(n, 5) == 0 do
      target_rate = ((220 - age - pulses) * n / 100 + pulses) |> Float.round() |> trunc()
      IO.puts("#{n}%       | #{target_rate} bpm")
    end
  end
end

HeartRate.read()
