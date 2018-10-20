defmodule PokeDex.Pokemon do
  use PokeDex.Web, :model

  schema "pokemons" do
    field :id_pokemon, :integer
    field :name, :string
    field :type1, :string
    field :type2, :string
    field :image, :string
    field :description, :string
    field :generation, :string
    field :size, :decimal
    field :weight, :decimal
    field :ratio, :integer
    field :captured, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:id_pokemon, :name, :type1, :type2, :image, :description, :generation, :size, :weight, :ratio, :captured])
    |> validate_required([:id_pokemon, :name, :type1, :type2, :image, :description, :generation, :size, :weight, :ratio, :captured])
  end
end
