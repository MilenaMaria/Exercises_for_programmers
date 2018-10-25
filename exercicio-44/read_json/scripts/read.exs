defmodule ReadJson do
  @moduledoc """
  Documentation for ReadJson.
  """
  def run do
    validate()
  end

  def read(products) do
    # IO.puts(Enum.map(products, & &1["name"]))

    IO.gets("What is the product name? ")
    |> String.trim()
    |> String.capitalize()
  end

  def get_products_from_file do
    File.read!("scripts/read.json")
    |> Jason.decode!()
    |> Map.fetch!("products")
  end

  def validate do
    products = get_products_from_file()
    name = read(products)

    case Enum.find(products, &(&1["name"] == name)) do
      nil -> validate()
      product -> print(product)
    end
  end

  def print(product) do
    IO.puts(
      "Name: #{product["name"]} \nPrice: $#{product["price"]} \nQuantity on hand: #{
        product["quantity"]
      }"
    )

    validate()
  end
end

ReadJson.run()
