defmodule PokeDexWeb.PageController do
  use PokeDexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def search(conn, %{"id" => id}) do
    pokemonName = ((("https://pokeapi.co/api/v2/pokemon/#{id}/" |> HTTPoison.get!).body |> JSON.decode!)["forms"] |> List.first) ["name"]
    render conn, "search.html",
      pokemonName: pokemonName
  end

end
