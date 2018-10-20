defmodule PokeDexWeb.WhoIsThatPokemonController do
  use PokeDexWeb, :controller

  def validate(conn, params) do

    url = "https://pokeapi.co/api/v2/pokemon/#{params["id"]}/"
    response = HTTPoison.get!(url)
    pokemon = JSON.decode!(response.body)["forms"] |> List.first
    name = pokemon["name"]
    result = params["name"] == name

    json conn,%{success: result,pokemon: name, yours: params["name"]}
  end



  def index(conn, params) do
    pokemonId = :rand.uniform(151)
    url = "https://pokeapi.co/api/v2/pokemon/#{pokemonId}/"
    response = HTTPoison.get!(url)
    pokemon = JSON.decode!(response.body)["forms"] |> List.first


    render conn, "index.html", 
      pokemonId: pokemonId 
  end
end
