defmodule PokeDexWeb.WhoIsThatPokemonController do
  use PokeDexWeb, :controller

  def validate(conn, params) do
    #BaiaBaia todas las variables tenian mal nombramiento (variable de una letra es mal práctica)
    #BaiaBaia params estaba marcado con underscore, pero si se usaba.
    url = "https://pokeapi.co/api/v2/pokemon/#{params["id"]}/"
    response = HTTPoison.get!(url)
    pokemon = JSON.decode!(response.body)["forms"] |> List.first
    name = pokemon["name"]
    result = params["name"] == name

    json conn,%{success: result,pokemon: name, yours: params["name"]}
  end



  def index(conn, params) do
    #BaiaBaia todas las variables tenian mal nombramiento (variable de una letra es mal práctica)
    #BaiaBaia params estaba marcado con underscore, pero si se usaba.
    pokemonId = :rand.uniform(151)
    url = "https://pokeapi.co/api/v2/pokemon/#{pokemonId}/"
    response = HTTPoison.get!(url)
    pokemon = JSON.decode!(response.body)

    image = pokemon["sprites"]["front_default"]

    render conn, "index.html", 
      pokemonId: pokemonId,
      pokemonImage: image
  end
end
