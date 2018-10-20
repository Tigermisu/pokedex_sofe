defmodule PokeDex.PokemonTest do
  use PokeDex.ModelCase

  alias PokeDex.Pokemon

  @valid_attrs %{captured: 42, description: "some description", generation: "some generation", id_pokemon: 42, image: "some image", name: "some name", ratio: 42, size: "120.5", type1: "some type1", type2: "some type2", weight: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pokemon.changeset(%Pokemon{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pokemon.changeset(%Pokemon{}, @invalid_attrs)
    refute changeset.valid?
  end
end
