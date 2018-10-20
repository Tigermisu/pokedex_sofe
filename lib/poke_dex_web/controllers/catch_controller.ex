defmodule PokeDexWeb.CatchController do
  use PokeDexWeb, :controller

  def index(conn, _params) do
    randomNumber = :rand.uniform(3) + 2
    range = for i<- 1..randomNumber, do: i
    textSet = Enum.reduce(range, "", fn(time,text) ->
      randomId = :rand.uniform(802)
      text <> "<br>Pokemon ##{randomId} is near by. Do you want to catch it?" <> "<a href=\"catchit?i=#{randomId}\">Catch!</a>"
    end)

    render conn, "index.html", text: textSet
  end
end
