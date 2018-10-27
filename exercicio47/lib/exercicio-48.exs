# Grabbing the Weather
defmodule GrabbingWeather do
  # use Tesla
  def run do
    get_city_weather(read())
  end

  defp read do
    IO.gets("Where are you?(City) ")
    |> String.trim()
  end

  defp get_id do
    Application.get_env(:exercicio47, :clima)
  end

  defp get_city_weather(location) do
    location = URI.encode(location)

    {:ok, response} =
      Tesla.get("https://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{get_id()}")

    weather =
      response.body
      |> Jason.decode!()

    wind =
      weather
      |> Map.fetch!("wind")

    temp_kelvin =
      weather
      |> Map.fetch!("main")
      |> Map.fetch!("temp")

    temp_fahrenheit = converter_to_fa(temp_kelvin)
    temp_celsius = converter_to_celsius(temp_kelvin)

    print(temp_fahrenheit, weather, temp_celsius)
    IO.puts("Wind: #{wind(wind)}")
    get_weather(weather)
  end

  def converter_to_celsius(k), do: Float.round(k - 273)
  def converter_to_fa(k), do: Float.round((k - 273) / 5 * 9 + 32, 2)

  defp get_weather(weather) do
    weather
    |> Map.fetch!("weather")
    |> Enum.each(&IO.puts("Description: #{&1["description"]}"))
  end

  defp wind(location) do
    a = location["deg"] |> trunc()
    IO.puts("Wind degrees: #{a}")

    cond do
      a in 0..19 -> "North"
      a in 20..39 -> "North/NE"
      a in 40..59 -> "NE"
      a in 60..79 -> "E/NE"
      a in 80..109 -> "E"
      a in 110..129 -> "E/SE"
      a in 130..149 -> "SE"
      a in 150..169 -> "S/SE"
      a in 170..199 -> "S"
      a in 200..219 -> "S/SW"
      a in 220..239 -> "SW"
      a in 240..259 -> "W/SW"
      a in 260..289 -> "W"
      a in 290..309 -> "W/NW"
      a in 310..329 -> "NW"
      a in 330..349 -> "N/NW"
      a in 350..360 -> "North"
    end
  end

  defp print(temp_fahrenheit, weather, temp_celsius) do
    # city = weather["name"]
    # city |> IO.puts()
    temp = weather |> Map.fetch!("main")
    IO.puts("--------------------------------------------------------------------------------")

    IO.puts("#{weather["name"]}, weather: #{temp_fahrenheit} degrees Fahrenheit.")
    IO.puts("#{weather["name"]}, weather: #{temp_celsius} degrees Celsius.")

    IO.puts(
      "Humidity #{temp["humidity"]} | Pressure: #{temp["pressure"]} | Temp max(°F): #{
        converter_to_fa(temp["temp_max"])
      } | Temp min(°F): #{converter_to_fa(temp["temp_min"])}"
    )

    IO.puts(
      "Humidity #{temp["humidity"]} | Pressure: #{temp["pressure"]} | Temp max(°C): #{
        converter_to_celsius(temp["temp_max"])
      } | Temp min(°C): #{converter_to_celsius(temp["temp_min"])}"
    )

    IO.puts("--------------------------------------------------------------------------------")
  end
end

GrabbingWeather.run()
