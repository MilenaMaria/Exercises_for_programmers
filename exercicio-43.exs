# Website Generator
defmodule WebGenerator do
  def run do
    create()
  end

  def read_dominio do
    name =
      IO.gets("Site name: ")
      |> String.trim()

    author =
      IO.gets("Author: ")
      |> String.trim()

    {name, author}
  end

  def read_option_folder do
    js =
      IO.gets("Do you want a folder for JavaScript? ")
      |> String.trim()
      |> String.upcase()

    css =
      IO.gets("Do you want a folder for CSS? ")
      |> String.trim()
      |> String.upcase()

    {js, css}
  end

  def create do
    {name, author} = read_dominio()
    {js, css} = read_option_folder()
    dir = name

    unless File.exists?(dir) do
      File.mkdir!("#{name}")
    end

    # IO.puts("Created ./#{name}")
    IO.puts("#{[IO.ANSI.green(), " * created", IO.ANSI.reset()]}" <> " ./#{name}")

    text_html(name, author)
    # IO.puts("Created ./#{name}/index.html")
    IO.puts("#{[IO.ANSI.green(), " * created", IO.ANSI.reset()]}" <> " ./#{name}/index.html")

    if js == "Y" do
      unless File.exists?("#{name}/js/") do
        File.mkdir!("#{name}/js/")
      end

      # IO.puts("Created ./#{name}/js/")

      IO.puts("#{[IO.ANSI.green(), " * created", IO.ANSI.reset()]}" <> " ./#{name}/js/")
    end

    if css == "Y" do
      unless File.exists?("#{name}/css/") do
        File.mkdir!("#{name}/css/")
      end

      IO.puts("#{[IO.ANSI.green(), " * created", IO.ANSI.reset()]}" <> " ./#{name}/css/")
    end
  end

  def text_html(name, author) do
    File.write!("#{name}/index.html", "<!DOCTYPE html>
    <html lang=\"en\">
    <head>
        <meta charset=\"UTF-8\">
        <meta name=\"#{author}\">
        <title>#{name}</title>
    </head>

    <body>
        <h1>Hello, #{author}! Este é seu site.<h1>
    </body>

    </html>")
  end
end

WebGenerator.run()
