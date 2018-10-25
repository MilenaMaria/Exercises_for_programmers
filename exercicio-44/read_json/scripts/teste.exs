list = File.read!("scripts/read.json")
list_decode = Jason.decode!(list)
products = list_decode["products"]
IO.inspect(products)

# products |> Enum.find(fn val -> val == val["Thing"] end) |> IO.puts()

a = Enum.find(products, &(&1["name"] == "Thing"))
IO.puts("Name: #{a["name"]} \nPrice: $#{a["price"]} \nQuantity on hand: #{a["quantity"]}")
# |> IO.puts()

# products |> Enum.filter(&{&1["name"] == "Thing", IO.puts(&1["name"])})
# |> IO.inspect("name")

# a = products |> Enum.filter(&(&1["name"] == "Thing"))
# IO.puts(products["Thing"])
