defmodule PokeDex.Repo.Migrations.CreatePokemon do
  use Ecto.Migration

  def change do
    create table(:pokemons) do
      add :id_pokemon, :integer
      add :name, :string
      add :type1, :string
      add :type2, :string
      add :image, :string
      add :description, :string
      add :generation, :string
      add :size, :decimal
      add :weight, :decimal
      add :ratio, :integer
      add :captured, :integer

      timestamps()
    end
  end
end
