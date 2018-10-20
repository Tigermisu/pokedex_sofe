defmodule PokeDexWeb.PageController do
  use PokeDexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def search(conn, %{"id" => id}) do
    #BaiaBaia todas las variables tenian mal nombramiento (variable de una letra es mal práctica)
    pokemon = (("https://pokeapi.co/api/v2/pokemon/#{id}/" |> HTTPoison.get!).body |> JSON.decode!)
    pokemonSpecies = (("https://pokeapi.co/api/v2/pokemon-species/#{id}/" |> HTTPoison.get!).body |> JSON.decode!)
    evolutionChain = ((pokemonSpecies["evolution_chain"]["url"] |> HTTPoison.get!).body |> JSON.decode!)
    render conn, "search.html",
      pokemonId: id,
      pokemonName: (pokemon["forms"] |> List.first) ["name"],
      pokemonType: Enum.reduce(pokemon["types"], "", fn type, text -> text <> type["type"]["name"] <> " " end),
      pokemonImage: pokemon["sprites"]["front_default"],
      evolutions: getEvolutions(evolutionChain["chain"]["evolves_to"])
  end

  def searchTypes(conn, %{"type" => type}) do
    types = (("https://pokeapi.co/api/v2/type/#{type}/" |> HTTPoison.get!).body |> JSON.decode!)

    # This works, it is just extremly slow
    # It took me 800s to render the list. But it did render nicely.
    pokemonData = Enum.map(types["pokemon"], fn pokemon -> getPokemonData(pokemon["pokemon"]) end)
    
    render conn, "searchTypes.html",
      type: type,
      pokemons: pokemonData
  end

  defp getPokemonData(pokemonSummary) do
    name = pokemonSummary["name"]
    pokemon = (("https://pokeapi.co/api/v2/pokemon/#{name}/" |> HTTPoison.get!).body |> JSON.decode!)

    [name: name, id: pokemon["id"], image: pokemon["sprites"]["front_default"]]
  end

  defp getEvolutions([]) do
    []
  end

  defp getEvolutions(rootNode) do  
    evolution = List.first(rootNode)

    id = Enum.at(String.split(evolution["species"]["url"], "/"), -2)
    url = "/search?id=#{id}"

    [[name: evolution["species"]["name"], url: url]] ++ getEvolutions(evolution["evolves_to"]) 
  end
end
