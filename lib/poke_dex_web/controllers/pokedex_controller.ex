defmodule PokeDexWeb.PokedexController do
  use PokeDexWeb, :controller

  def index(conn, %{"id" => id}) do
    render conn, "index.html", pokemon: getPokemon id
  end

  def index(conn, _params) do
    render conn, "index.html", pokemon: getPokemon 1
  end

  def getPokemon(id) do
    #BaiaBaia todas las variables tenian mal nombramiento (variable de una letra es mal práctica)
    url = "https://pokeapi.co/api/v2/pokemon/#{id}/"
    response = HTTPoison.get!(url)
    pokemonData = JSON.decode!(response.body)

    pokemonType = Enum.reduce(pokemonData["types"], "", fn type, text -> text <> type["type"]["name"] <> " " end)
    pokemonImage = pokemonData["sprites"]["front_default"]

    {nextId, ""} = Integer.parse(id)

    [
      name: (pokemonData["forms"] |> List.first)["name"], 
      id: id,
      nextId: nextId + 1,
      img: pokemonImage,
      type: pokemonType
    ]
  end

end
