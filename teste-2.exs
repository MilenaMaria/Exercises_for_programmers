defmodule Users do
  @pass 11
  user = %{name: "Dave", pass: 11}

  case user do
    %{name: some_pass} == @pass ->
      IO.puts("#{person.name} lives in #{some_state}")

    _ ->
      IO.puts("No matches")
  end
end
