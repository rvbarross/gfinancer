defmodule Gfinancer.Financas.Despesas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas" do
    field :descricao, :string
    field :valor, :string

    timestamps()
  end

  @doc false
  def changeset(despesas, attrs) do
    despesas
    |> cast(attrs, [:descricao, :valor])
    |> validate_required([:descricao, :valor])
  end
end
