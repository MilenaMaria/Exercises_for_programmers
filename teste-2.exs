defmodule Example do
  def read_file(file) do
    if File.exists?(file) do
      File.read!(file) |> IO.inspect()
    end
  end
end

Example.read_file("test.txt")
