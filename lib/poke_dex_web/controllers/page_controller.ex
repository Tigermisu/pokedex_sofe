defmodule PokeDexWeb.PageController do
  use PokeDexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def search(conn, %{"i" => i}) do
    #TODO please kill me
    p = ((("https://pokeapi.co/api/v2/pokemon/#{i}/" |> HTTPoison.get!).body |> JSON.decode!)["forms"] |> List.first) ["name"]
    html conn, """
  <h1>#{p}</h1>
"""
  end

end
