# cria um mapa de usuarios map
defmodule Validation do
  def validation do
    user_n =
      IO.gets("User? ")
      |> String.trim()

    pass_w =
      IO.gets("Whats is te password? ")
      |> String.trim()

    validacao =
      Enum.any?(user(), fn %{user: user, pass: pass} ->
        user == user_n and pass == pass_w
      end)

    IO.puts(valida(validacao))
  end

  defp user do
    [
      %{user: "user", pass: "pass"},
      %{user: "adm", pass: "admin"},
      %{user: "elsa", pass: "frozen"},
      %{user: "user", pass: "abc$123"}
    ]
  end

  defp valida(true), do: "Welcome!!"
  defp valida(false), do: "I don't know you."
end

Validation.validation()
