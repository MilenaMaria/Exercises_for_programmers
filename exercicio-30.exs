# Multiplication Table
defmodule TableMultiplication do
  def mult do
    for n <- 0..12 do
      for j <- 0..12 do
        IO.puts(" #{n} X #{j} = #{n * j}")
      end
    end
  end
end

# ------------------------------------------------#
defmodule MultiplicationTable do
  def mult do
    for n <- 1..12 do
      for j <- 1..12 do
        IO.write("#{n * j}\t")
      end

      IO.puts("")
    end
  end
end

MultiplicationTable.mult()
