defmodule PokeDexWeb.Router do
  use PokeDexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PokeDexWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/search", PageController, :search
    get "/searchType", PageController, :searchTypes
    get "/pokedex", PokedexController, :index
    get "/catch", CatchController, :index
    get "/catchit", CatchPokemonController, :index
    get "/whoPokemon", WhoIsThatPokemonController, :index
    get "/whoPokemonValidate", WhoIsThatPokemonController, :validate
  end


  # Other scopes may use custom stacks.
  # scope "/api", PokeDexWeb do
  #   pipe_through :api
  # end
end
