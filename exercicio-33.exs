# Magic 8 Ball
defmodule MagicBall do
  def run do
    read()
  end

  def read do
    IO.gets("What's your question? ")
    check()
  end

  def check do
    display = Enum.random(["Yes", "No", "Maybe", "Ask again later"])
    IO.puts(display)
    play_again()
  end

  defp play_again() do
    option =
      IO.gets("Play again? ")
      |> String.trim()
      |> String.upcase()

    if option == "Y" or option == "S" do
      run()
    end
  end
end

MagicBall.run()
