defmodule PokeDexWeb.CatchPokemonController do
  use PokeDexWeb, :controller

  def index(conn, %{"id" => id}) do
    #BaiaBaia todas las variables tenian mal nombramiento (variable de una letra es mal práctica)
    captureRate = (("https://pokeapi.co/api/v2/pokemon-species/#{id}/" |> HTTPoison.get!).body |> JSON.decode!)["capture_rate"]
    response = HTTPoison.get!("https://pokeapi.co/api/v2/pokemon/#{id}/")
    pokemon = JSON.decode!(response.body)["forms"] |> List.first
    render conn, "index.html", 
      captureRate: captureRate,
      pokemonName: pokemon["name"],
      pokemonId: id
  end

end
