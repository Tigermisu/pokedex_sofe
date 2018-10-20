defmodule PokeDexWeb.CatchPokemonController do
  use PokeDexWeb, :controller

  def f4(conn, %{"i" => i}) do
    c = (("https://pokeapi.co/api/v2/pokemon-species/#{i}/" |> HTTPoison.get!).body |> JSON.decode!)["capture_rate"]
    r = HTTPoison.get!("https://pokeapi.co/api/v2/pokemon/#{i}/")
    p = JSON.decode!(r.body)["forms"] |> List.first
    html conn, """
    <h1>Gotta catch'em all</h1>
    <h3>Capture rate: #{c}</h3>
    <h2>Pokemon ##{i} #{p["name"]}</h2>
    <a href="http://fgnoe.com/sofe_scoreboard"><button>Catch</button></a>
"""
  end

end
