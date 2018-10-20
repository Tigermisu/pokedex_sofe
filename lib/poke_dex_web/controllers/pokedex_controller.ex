defmodule PokeDexWeb.PokedexController do
  use PokeDexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", pokemon: getPokemon 1, ""
  end

  def getPokemon(15, text) do 
    text
  end

  def getPokemon(counter, text) do
    url = "https://pokeapi.co/api/v2/pokemon/#{counter}/"
    response = HTTPoison.get!(url)
    pokemonData = JSON.decode!(response.body)["forms"] |> List.first
    text = text <> "<h2>##{counter} #{pokemonData["name"]}</h2>"
    getPokemon(counter+1, text)
  end

end
