defmodule PokeDexWeb.WhoIsThatPokemon do
  use PokeDexWeb, :controller

  def f1(conn,_params) do

    url = "https://pokeapi.co/api/v2/pokemon/#{_params["id"]}/"
    response = HTTPoison.get!(url)
    pokemon = JSON.decode!(response.body)["forms"] |> List.first
    name = pokemon["name"]
    result = _params["name"] == name

    json conn,%{success: result,pokemon: name, yours: _params["name"]}
  end



  def whoIs(conn, _params) do
    poke_id = :rand.uniform(151)
    url = "https://pokeapi.co/api/v2/pokemon/#{poke_id}/"
    response = HTTPoison.get!(url)
    pokemon = JSON.decode!(response.body)["forms"] |> List.first


    html conn, """
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
    $(document).ready(function(){
        $("#btn").click(function() {
          var pokemon = {name : document.getElementById("i") , id : #{poke_id} }
          $.ajax({
            method: "GET",
            url: "/whoPokemonValidate?name="+document.getElementById("i").value+"&id=#{poke_id}"
          })
            .done(function( msg ) {
              if (msg.success) {
                alert("You win!!!!");
              } else {
                alert ("You Lose!! :(");
              }
            });
     })
    })

    </script>

  <h1>Pokemon Id:</h1>
  <h1>#{poke_id}</h1>
  <h1>
  <input type="text" id="i"><button id="btn">Try</button>
  </h1>
  <a href="/">Home</a>

"""
  end
end
