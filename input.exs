defmodule Inputs do
  def string(message) do
    IO.gets(message)
    |> String.trim()
  end
end
