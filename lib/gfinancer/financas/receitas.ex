defmodule Gfinancer.Financas.Receitas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :descricao, :string
    field :valor, :string

    timestamps()
  end

  @doc false
  def changeset(receitas, attrs) do
    receitas
    |> cast(attrs, [:descricao, :valor])
    |> validate_required([:descricao, :valor])
  end
end
