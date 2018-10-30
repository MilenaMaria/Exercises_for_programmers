# Movie Recommendations
defmodule MovieRecommendations do
  def run do
    # con(read())

    read_movie()
    |> search_movie()
    |> print_results()

    run()
  end

  defp get_id do
    Application.get_env(:exercicio47, :api_key)
  end

  defp search_movie(movie) do
    # IO.inspect(movie_String)

    movie_data = find_movie(movie)

    recommendations = get_recommendations(movie_data)

    # não tem tratamento para filmes não encontrados

    {movie_data, recommendations}
  end

  def find_movie(movie) do
    movie = URI.encode(movie)

    movie_string = String.downcase(movie)

    {:ok, response} =
      Tesla.get(
        "https://api.themoviedb.org/3/search/movie?api_key=#{get_id()}&language=en-US&query=#{
          movie
        }&page=1&include_adult=false"
      )

    # teste =
    #   response.body
    #   |> Jason.decode!()
    #   |> IO.inspect()
    response.body
    |> Jason.decode!()
    |> Map.fetch!("results")
    |> Enum.find(fn x -> String.downcase(x["title"]) =~ movie_string end)
  end

  def get_recommendations(movie_data) do
    {:ok, response} =
      Tesla.get(
        "https://api.themoviedb.org/3/movie/#{find_movie["id"]}/recommendations?api_key=#{
          get_id()
        }&language=en-US&page=1"
      )

    response.body
    |> Jason.decode!()
  end

  defp read_movie do
    IO.gets("Enter the name of a movie: ") |> String.trim()
  end

  def print_results({movie_data, recommendations}) do
    IO.puts(
      "================================================================================================="
    )

    print_output([
      {"Name", movie_data["title"]},
      {"Description", movie_data["overview"]},
      {"Original language", movie_data["original_language"]},
      {"Release date", movie_data["release_date"]},
      {"Vote average", movie_data["vote_average"]},
      {"Recommendation", recommendation(movie_data)}
    ])

    # IO.puts(
    #   "#{[IO.ANSI.blue(), "Name:", IO.ANSI.reset()]} #{} \n#{
    #     [IO.ANSI.blue(), "Description: ", IO.ANSI.reset()]
    #   }#{find_movie["overview"]} \n#{[IO.ANSI.blue(), "Original language: ", IO.ANSI.reset()]} #{
    #     find_movie["original_language"]
    #   } \n#{[IO.ANSI.blue(), "Release date: ", IO.ANSI.reset()]} #{find_movie["release_date"]} \n#{
    #     [IO.ANSI.blue(), "Vote average: ", IO.ANSI.reset()]
    #   } #{find_movie["vote_average"]}  \n#{[IO.ANSI.blue(), "Recommendation: ", IO.ANSI.reset()]} #{
    #     recommendation(find_movie)
    #   }"
    # )

    IO.puts(
      "================================================================================================="
    )

    recommendations =
      recommendations
      |> Map.fetch!("results")
      |> Enum.map(&"#{&1["title"]}")
      |> Enum.join(", ")

    print_output([{"More recommendations", recommendations}])

    IO.puts(
      "================================================================================================="
    )
  end

  def print_output(pairs) do
    pairs
    |> Enum.map(fn {key, value} ->
      "#{[IO.ANSI.blue(), key, "\:", IO.ANSI.reset()]} #{value}"
    end)
    |> Enum.join("\n")
    |> IO.puts()
  end

  def recommendation(movie_data) do
    if movie_data["vote_average"] >= 6.0 do
      "You should watch this movie right now!"
    else
      "You not should watch this movie!"
    end
  end
end

MovieRecommendations.run()
