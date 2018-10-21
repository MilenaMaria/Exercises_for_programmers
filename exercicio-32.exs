# Guess the number game
defmodule GuessNumberGame do
  def run do
    IO.puts("=====================================")
    IO.puts("|..::Let's play Guess the Number::..|")
    IO.puts("=====================================")
    number = randon_number(read_lv())

    guess =
      IO.gets("Humm.. I have my number. What's your guess? ")
      |> String.trim()
      |> String.to_integer()

    check(guess, number, 1)
    # IO.puts("I have my number. What's your guess?")
  end

  def read_lv do
    input =
      IO.gets("Pick a difficulty level(1,2 or 3): ")
      |> String.trim()

    if input in ~w[1 2 3], do: String.to_integer(input), else: read_lv()
  end

  def randon_number(1), do: Enum.random(1..10)
  def randon_number(2), do: Enum.random(1..100)
  def randon_number(3), do: Enum.random(1..1000)

  # def randon_number(_) do
  #   IO.puts("Level invalid.")
  #   run()
  # end

  def check(guess, number, tentativas) do
    # IO.inspect("Number: #{number}")
    # IO.inspect("Guess: #{guess}")
    # IO.inspect("tentativas: #{tentativas}")

    cond do
      number < guess ->
        IO.puts("Ooh!Too high.")
        guess_input(guess, number, tentativas + 1)

      number > guess ->
        IO.puts("Ooh! Too low.")
        guess_input(guess, number, tentativas + 1)

      number == guess ->
        cond do
          tentativas == 1 ->
            IO.puts("||You’re a mind reader!||\n||Guesses: #{tentativas}||")

          tentativas > 1 and tentativas <= 3 ->
            IO.puts("||Most impressive.||\n||Guesses: #{tentativas}||")

          tentativas > 3 and tentativas <= 6 ->
            IO.puts("||You can do better than that.||\n||Guesses: #{tentativas}||")

          tentativas > 6 ->
            IO.puts("||Better luck next time.|| \n||Guesses: #{tentativas}||")
        end

        # IO.puts("..::You got it in #{tentativas} guesses!::..")
        play_again()
    end
  end

  defp guess_input(_guess, number, tentativas) do
    guess =
      IO.gets("Guess again: ")
      |> String.trim()
      |> String.to_integer()

    check(guess, number, tentativas)
  end

  defp play_again() do
    option =
      IO.gets("Play again? ")
      |> String.trim()

    if option == "y" do
      run()
    else
      IO.puts("........::::: Bye bye!! :::::........")
      IO.puts("=====================================")
    end
  end
end

GuessNumberGame.run()
