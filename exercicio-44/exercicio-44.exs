# Product Search
defmodule ProductSearch do
  def run do
  end

  def read do
    IO.gets("What is the product name? ")
    |> String.trim()
  end

  def search do
    IO.puts(File.read!("read.json"))
  end
end

ProductSearch.run()
