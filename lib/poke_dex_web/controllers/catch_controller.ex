defmodule PokeDexWeb.CatchController do
  use PokeDexWeb, :controller

  def f3(conn, _params) do
    n = :rand.uniform(3) + 2
    f = for i<- 1..n, do: i
    s = Enum.reduce(f, "", fn(time,a) ->
      r = :rand.uniform(802)
      a <> "<br>Pokemon ##{r} is near by. Do you want to catch it?" <> "<a href=\"catchit?i=#{r}\">Catch!</a>"
    end)

    html conn, s
  end
end
