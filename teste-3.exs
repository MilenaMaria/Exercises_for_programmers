name = [
  ["Ling, Mai, 55900"],
  ["Johnson, Jim, 56500"],
  ["Zarneck, Sabrina, 46000"],
  ["Jones, Chris, 34500"],
  ["Jones, Aaron, 14200"],
  ["Swift, Geoffrey, 65000"],
  ["Xiong, Fong, 51500"]
]

a = Enum.each(name, fn x -> to_string(x) end)
IO.inspect(a)
