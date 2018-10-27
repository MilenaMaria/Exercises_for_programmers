defmodule Teste do
  def get_id do
    "eeb559632fda0d30d553ea33145865b1"
  end

  def get_city(location) do
    location = URI.encode(location)

    Tesla.get("https://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{get_id()}")
    |> IO.inspect()

    # "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=[yourID]"
  end
end

Teste.get_city("London")
