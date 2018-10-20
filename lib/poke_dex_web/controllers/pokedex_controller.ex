defmodule PokeDexWeb.PokedexController do
  use PokeDexWeb, :controller

  def s(conn, _params) do
    c = 1
    h = "<h1>Pokedex</h1>"
    p(conn, c, h)
  end

  def p(conn, i, t) do
    if i <= 15 do
      u = "https://pokeapi.co/api/v2/pokemon/#{i}/"
      r = HTTPoison.get!(u)
      p2 = JSON.decode!(r.body)["forms"] |> List.first
      t = t <> "<h2>##{i} #{p2["name"]}</h2>"
      i = i+1
      p(conn, i, t)
    else
      html conn, t
    end
  end

end
